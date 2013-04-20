class Artist < Sequel::Model
  attr_accessor :name
  one_to_many :albums
end
