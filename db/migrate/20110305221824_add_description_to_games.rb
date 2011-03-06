class AddDescriptionToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :description, :text
  end

  def self.down
    remove_column :games, :description
  end
end
