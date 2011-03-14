class GameNewsItem < NewsItem
  validates :parent_id, :presence => true

  belongs_to :game, :class_name => "Game", :foreign_key => "parent_id"

  def self.forGame(game)
    GameNewsItem.where(:parent_id => game.id)
  end
end
