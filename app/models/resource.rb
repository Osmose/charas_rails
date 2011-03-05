class Resource < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    # Paperclip
    has_attached_file :res, :styles => { :small => "100x100#" }
    
    # Specify to not post-process non-image files
    before_post_process :image?
    def image?
        !(res_content_type =~ /^image.*/).nil?
    end
    
    cattr_reader :per_page
    @@per_page = 20
end
