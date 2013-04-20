class Artist < Sequel::Model
  attr_accessor :name
  one_to_many :albums
  plugin :validation_helpers

  def validate
    super
    validates_presence :name
    validates_unique :name
  end
end
