class AddResColumnsToResource < ActiveRecord::Migration
    def self.up
        remove_column :resources, :href
        
        add_column :resources, :res_file_name,    :string
        add_column :resources, :res_content_type, :string
        add_column :resources, :res_file_size,    :integer
        add_column :resources, :res_updated_at,   :datetime
    end

    def self.down
        add_column :resources, :href, :string
        
        remove_column :resources, :avatar_file_name
        remove_column :resources, :avatar_content_type
        remove_column :resources, :avatar_file_size
        remove_column :resources, :avatar_updated_at
    end
end
