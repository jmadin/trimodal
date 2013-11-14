class Spawner < ActiveRecord::Base

  validates :fieldtrip_id, :presence => true
  validates :tag_number, :presence => true

  belongs_to :fieldtrip
  belongs_to :contributor
end
