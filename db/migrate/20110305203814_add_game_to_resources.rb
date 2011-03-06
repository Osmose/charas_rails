class AddGameToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :game_id, :integer
  end

  def self.down
    remove_column :resources, :game_id
  end
end
