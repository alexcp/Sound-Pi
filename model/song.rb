class Song < Sequel::Model
  attr_accessor :name, :artist_id, :album_id, :length, :path, :genre

end
