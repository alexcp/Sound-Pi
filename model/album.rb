class Album < Sequel::Model
  attr_accessor :name, :artist_id
  one_to_many :songs
  many_to_one :artist
end
