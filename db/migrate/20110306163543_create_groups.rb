class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :real_id, :default => 0
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
