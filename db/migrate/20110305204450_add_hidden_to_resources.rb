class AddHiddenToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :hidden, :boolean, :default => false
  end

  def self.down
    remove_column :resources, :hidden
  end
end
