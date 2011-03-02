class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.string :href
      t.references :category
      t.references :user
    
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
