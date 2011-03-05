class Resource < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    # Paperclip
    has_attached_file :res, :styles => { :small => "100x100#" }, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:id/:filename"
    
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
end
