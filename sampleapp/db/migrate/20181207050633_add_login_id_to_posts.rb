class AddLoginIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :login_id, :integer, :references => :logins
  end

  def self.down
    remove_column :posts, :login_id
  end
end
