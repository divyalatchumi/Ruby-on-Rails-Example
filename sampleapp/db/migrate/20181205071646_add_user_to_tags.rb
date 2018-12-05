class AddUserToTags < ActiveRecord::Migration
  def self.up
  	change_table :tags do |t|
      t.boolean :user, :default => false
    end
    Tag.update_all ["user = ?", true]
  end

  def self.down
  	remove_column :tag, :user
  end
end
