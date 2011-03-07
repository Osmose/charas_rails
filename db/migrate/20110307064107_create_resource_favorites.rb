class CreateResourceFavorites < ActiveRecord::Migration
  def self.up
    create_table :resource_favorites do |t|
      t.references :user
      t.references :resource
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_favorites
  end
end
