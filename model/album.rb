class Album < Sequel::Model
  attr_accessor :name, :artist_id
  one_to_many :songs
  many_to_one :artist
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name, :artist_id]
    validates_unique :name
  end
end
