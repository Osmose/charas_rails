class AddEngineToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :engine, :string
  end

  def self.down
    remove_column :games, :engine
  end
end
