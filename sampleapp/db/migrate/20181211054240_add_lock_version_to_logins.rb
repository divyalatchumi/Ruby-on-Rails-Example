class AddLockVersionToLogins < ActiveRecord::Migration
  def self.up
    add_column :logins, :lock_version, :integer
  end

  def self.down
    remove_column :logins, :lock_version
  end
end
