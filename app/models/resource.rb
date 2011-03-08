class Resource < ActiveRecord::Base
  Gravity = 1.8 # Used in ranking
  ImageTypes = ["image/jpeg", "image/png", "image/gif"]
  AudioTypes = ["audio/midi", "audio/mid", "audio/x-mid", "audio/x-midi",
    "application/x-midi", "music/crescendo", "x-music/x-midi"]
  AllowedTypes = ImageTypes + AudioTypes

  belongs_to :user
  belongs_to :category
  belongs_to :game

  has_many :resource_favorites
  has_many :fans, :source => :user, :through => :resource_favorites

  # Paperclip
  has_attached_file :res, :styles => { :small => "100x100#" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/resources/:style/:id/:filename"

  # Allowed content types
  validates_attachment_content_type :res, :content_type => AllowedTypes
    
  # Specify to not post-process non-image files
  before_post_process :image?
  def image?
    type == :image
  end
    
  # Search options
  scoped_search :on => [:name, :description]
    
  # Pagination
  cattr_reader :per_page
  @@per_page = 20

  # Determine type of this resource
  def type
    if ImageTypes.include?(res_content_type)
      :image
    elsif AudioTypes.include?(res_content_type)
      :audio
    else
      :unknown
    end
  end

  # Get the url for the thumbnail for this resource
  def thumbnail_url
    case type
    when :image
      res.url(:small)
    when :audio
      "icons/med/sound.png"
    when :unknown
      "icons/med/page.png"
    end
  end

  def self.search_query(search)
    results = Resource.scoped

    if search.category_id
      results = results.where(:category_id => search.category_id)
    end

    results.search_for(search.query)
  end

  def self.find_by_rank(limit = 20)
    case ActiveRecord::Base.connection.adapter_name
    when "MySQL"
      Resource.find_by_sql("
        SELECT
          r.*,
          COUNT(f.id) / POWER((UNIX_TIMESTAMP(UTC_TIMESTAMP()) - UNIX_TIMESTAMP(r.created_at)) / 3600, 1.8) as rank
        FROM resources AS r
          LEFT JOIN resource_favorites AS f ON r.id = f.resource_id
        GROUP BY r.id
        ORDER BY rank DESC, r.created_at DESC
        LIMIT #{limit}")
    when "PostgreSQL"
      Resource.find_by_sql("
        SELECT
          r.*,
          COUNT(f.id) / POW(EXTRACT(EPOCH FROM NOW() - r.created_at) / 3600, 1.8) as rank
        FROM resources AS r
          LEFT JOIN resource_favorites AS f ON r.id = f.resource_id
        GROUP BY r.id
        ORDER BY rank DESC, r.created_at DESC
        LIMIT #{limit}")
    end
  end
end
