class Song < Sequel::Model
  attr_accessor :name, :album_id, :length, :path, :genre
  many_to_one :album, eager: [:artist]
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name, :album_id, :length, :path]
    validates_unique :name, :path
  end
end
