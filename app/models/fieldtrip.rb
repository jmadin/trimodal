class Fieldtrip < ActiveRecord::Base
  has_many :observations
  has_many :spawners

  validates :name, :presence => true
  validates :name_code, :presence => true

end
