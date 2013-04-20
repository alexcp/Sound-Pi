class Artist < Sequel::Model
  one_to_many :albums, eager: [:song]
  plugin :validation_helpers

  def raise_on_save_failure
    false
  end

  def validate
    super
    validates_presence :name
    validates_unique :name
  end
end
