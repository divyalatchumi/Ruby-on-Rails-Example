class CreatorObserver < ActiveRecord::Observer
	observe :tag, :genre, :artist, :song, :albums
	def after_create(model)
		puts "Record created"
	end
end