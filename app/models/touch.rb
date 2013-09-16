class Touch < ActiveRecord::Base
  validates :touch_number, :numericality => { :greater_than => 0 }, :on => :create
  
  belongs_to :area
end
