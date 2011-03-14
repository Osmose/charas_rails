class Game < ActiveRecord::Base
  include PaperClipHelper

  AllowedEngines = [
    "Other",
    "RPG Maker 2000",
    "RPG Maker 2003",
    "RPG Maker XP",
    "RPG Maker VX",
    "Game Maker",
    "Stencyl"
  ]

  validates :name, :presence => true
  validates :engine, :inclusion => {:in => AllowedEngines}

  belongs_to :user

  # I don't like this, but can't find any better way currently. Games don't
  # actually belong to screenshots; rather, each game has an optional screenshot
  # that functions as it's logo on search results and the game show page. But
  # for some reason, Rails assumes that if a table has the foreign key, it is
  # the child in the relationship and should "belong_to" the not-parent.
  belongs_to :screenshot

  has_many :resources
  has_many :news_items

  has_attached_file_s3 :file,
    :path => "/games/files/:style/:id/:filename"
  validates_attachment_content_type :file, :content_type => ["application/zip"]

  def is_developer?(dev)
    user == dev
  end

  def logo_url
    if screenshot
      screenshot.img.url(:small)
    else
      "unknown_thumb.png"
    end
  end
end
