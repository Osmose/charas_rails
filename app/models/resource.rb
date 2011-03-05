class Resource < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    cattr_reader :per_page
    @@per_page = 10
end
