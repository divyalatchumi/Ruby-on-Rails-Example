class Login < ActiveRecord::Base
	validates_presence_of :username, :password, :email 
	validates_confirmation_of :password
	validates_length_of :username, :password, :minimum => 8
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates_uniqueness_of :username, :email
	set_locking_column :lock_version
end
