class Observation < ActiveRecord::Base

  # validates :fieldtrip_id, :uniqueness => true, :on => :create
  validates :fieldtrip_id, :presence => true
  validates :tag_number, :presence => true

  validates_numericality_of :tag_number, :only_integer =>true, :greater_than_or_equal_to => 0

  belongs_to :coral
  belongs_to :fieldtrip
  
  has_many :areas
  
  def self.search(osearch)
      if osearch
        where('tag_number = ? OR active_tag = ? OR action LIKE ? OR notes LIKE ?', osearch, osearch, "%#{osearch}%", "%#{osearch}%")
      else
        all
      end
  end  
  
end

