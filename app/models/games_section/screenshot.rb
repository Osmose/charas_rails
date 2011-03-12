class Screenshot < ActiveRecord::Base
  include PaperClipHelper

  belongs_to :game
  has_attached_file_s3 :img, 
    :styles => { :small => "150x113#" },
    :path => "/games/screenshots/:style/:id/:filename"

  def self.for_game(game_id)
    Screenshot.where(:game_id => game_id)
  end

  def next
    Screenshot.for_game(game.id).where(["created_at < ?", created_at]).order("created_at DESC").first
  end

  def previous
    Screenshot.for_game(game.id).where(["created_at > ?", created_at]).order("created_at ASC").first
  end
end
