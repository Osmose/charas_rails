class CreateGameMetaTypes < ActiveRecord::Migration
  def self.up
    create_table :game_meta_types do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :game_meta_types
  end
end
