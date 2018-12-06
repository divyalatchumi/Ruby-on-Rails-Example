class Albums < ActiveRecord::Base
	belongs_to :genreArtist, :polymorphic => true
	has_many :songs
end
