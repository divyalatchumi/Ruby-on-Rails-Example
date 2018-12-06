class TagsObserver < ActiveRecord::Observer
	observe :tag
	def after_create(model)
		puts "Tag created"
	end
end