class AddUserToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :user, :string
  end

  def self.down
    remove_column :tags, :user
  end
end
