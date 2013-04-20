class Song < Sequel::Model
  attr_accessor :name, :album_id, :length, :path, :genre
  many_to_one :album, eager: [:artist]
end
