class ChangeNewsItemToSingleTableInheritence < ActiveRecord::Migration
  def self.up
    rename_column :news_items, :game_id, :parent_id
    add_column :news_items, :type, :string
  end

  def self.down
    rename_column :news_items, :parent_id, :game_id
    remove_column :news_items, :type
  end
end
