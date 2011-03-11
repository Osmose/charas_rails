class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.string :type
      t.references :user

      t.timestamps
    end

    add_index :achievements, [:type, :user_id], :unique => true
  end

  def self.down
    drop_table :achievements
  end
end
