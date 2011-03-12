class ChangeLogoToScreenshotInGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :logo_updated_at
    remove_column :games, :logo_file_size
    remove_column :games, :logo_content_type
    remove_column :games, :logo_file_name

    add_column :games, :screenshot_id, :integer
  end

  def self.down
    add_column :games, :logo_file_name, :string
    add_column :games, :logo_content_type, :string
    add_column :games, :logo_file_size, :integer
    add_column :games, :logo_updated_at, :datetime

    remove_column :games, :screenshot_id
  end
end
