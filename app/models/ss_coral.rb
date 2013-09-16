class SsCoral < ActiveRecord::Base

  validates :fieldtrip_id, :presence => true

  belongs_to :fieldtrip
end
