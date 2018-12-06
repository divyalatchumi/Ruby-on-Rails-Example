class Genre < ActiveRecord::Base
	has_many :albums, :as => :genreArtist
end
