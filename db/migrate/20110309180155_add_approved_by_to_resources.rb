class AddApprovedByToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :approved_by, :integer
    remove_column :resources, :approved
  end

  def self.down
    remove_column :resources, :approved_by
    add_column :resources, :approved, :boolean
  end
end
