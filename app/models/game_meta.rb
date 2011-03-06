class GameMeta < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_meta_type
end
