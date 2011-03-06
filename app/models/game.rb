class Game < ActiveRecord::Base
  belongs_to :user

  has_many :game_metas
  has_many :resources
  
  has_attached_file :logo, :styles => { :small => "150x113#" },
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/games/logos/:style/:id/:filename"
end
