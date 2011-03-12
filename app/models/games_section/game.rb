class Game < ActiveRecord::Base
  include PaperClipHelper

  AllowedEngines = [
    "RPG Maker 2000",
    "RPG Maker 2003",
    "RPG Maker XP",
    "RPG Maker VX",
    "Game Maker",
    "Stencyl",
    "Other"
  ]
  
  validates :engine, :inclusion => {:in => AllowedEngines}, :allow_nil => true

  belongs_to :user

  has_many :resources
  
  has_attached_file_s3 :logo, 
    :styles => { :small => "150x113#" },
    :path => "/games/logos/:style/:id/:filename"

  has_attached_file_s3 :file,
    :path => "/games/files/:style/:id/:filename"
  validates_attachment_content_type :file, :content_type => ["application/zip"]

  def isDeveloper?(dev)
    user == dev
  end
end
