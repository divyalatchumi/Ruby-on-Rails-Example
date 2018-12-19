class DropEmailFromLogins < ActiveRecord::Migration
  def self.up
  	remove_column :logins, :email
  end

  def self.down
  	add_column :logins, :email, :string
  end
end
