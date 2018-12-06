class Post < ActiveRecord::Base
	def after_initialize
    	puts "You have initialized an object!"
  	end
  	def after_find
	    puts "You have found an object!"
	end
	after_save :print_save_successful
	#validates_presence_of :name, :title
	validates_confirmation_of :name, :unless => "name.blank?"
  	validates_length_of :title, :minimum => 5
  	validates_acceptance_of :terms_of_service	
  	validates_confirmation_of :name
  	has_many :comments
  	has_many :tags


	accepts_nested_attributes_for :tags, :allow_destroy => :true  ,
	  	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

	protected
	def print_save_successful
		puts "Post saved successfully"
	end
end
