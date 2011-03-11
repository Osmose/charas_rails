class DestroyGameMetas < ActiveRecord::Migration
  def self.up
    drop_table :game_metas
    drop_table :game_meta_types
  end
  
  def self.down
    create_table :game_metas do |t|
      t.string :value
      t.references :game
      t.references :game_meta_type

      t.timestamps
    end

    create_table :game_meta_types do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
