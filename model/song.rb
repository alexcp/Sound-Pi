class Song < Sequel::Model
  many_to_one :album
  plugin :validation_helpers

  def raise_on_save_failure
    false
  end

  def validate
    super
    validates_presence [:name, :album, :path]
    validates_unique :name, :path
  end
end
