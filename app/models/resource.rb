class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :game

  has_many :resource_favorites
  has_many :fans, :class_name => "User", :through => :resource_favorites
    
  # Paperclip
  has_attached_file :res, :styles => { :small => "100x100#" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/resources/:style/:id/:filename"
    
  # Specify to not post-process non-image files
  before_post_process :image?
  def image?
    !(res_content_type =~ /^image.*/).nil?
  end
    
  # Search options
  scoped_search :on => [:name, :description]
    
  # Pagination
  cattr_reader :per_page
  @@per_page = 20

  def self.search_query(search)
    results = Resource.scoped

    if search.category_id
      results = results.where(:category_id => search.category_id)
    end

    results.search_for(search.query)
  end
end
