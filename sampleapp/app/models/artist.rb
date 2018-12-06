class Artist < ActiveRecord::Base
	has_many :albums, :as => :genreArtist
	has_many :songs, :through => :albums
end
