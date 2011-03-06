class AddLogoToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :logo_file_name, :string
    add_column :games, :logo_content_type, :string
    add_column :games, :logo_file_size, :integer
    add_column :games, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :games, :logo_updated_at
    remove_column :games, :logo_file_size
    remove_column :games, :logo_content_type
    remove_column :games, :logo_file_name
  end
end
