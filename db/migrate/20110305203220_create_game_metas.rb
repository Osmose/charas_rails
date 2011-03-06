class CreateGameMetas < ActiveRecord::Migration
  def self.up
    create_table :game_metas do |t|
      t.string :value
      t.references :game
      t.references :game_meta_type
      
      t.timestamps
    end
  end

  def self.down
    drop_table :game_metas
  end
end
