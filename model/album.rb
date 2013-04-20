class Album < Sequel::Model
  one_to_many :songs
  many_to_one :artist
  plugin :validation_helpers

  def raise_on_save_failure
    false
  end

  def validate
    super
    validates_presence [:name, :artist]
    validates_unique :name
  end
end
