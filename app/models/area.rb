class Area < ActiveRecord::Base

  validates :outline_filename, :presence => true
  validates :outliner_name, :presence => true

  belongs_to :observation
  has_many :touches


end
