class AddApprovedToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :resources, :approved
  end
end
