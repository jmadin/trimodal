class Fieldtrip < ActiveRecord::Base
  has_many :observations
  has_many :spawners
end
