class Coral < ActiveRecord::Base
  
  validates :transect, :presence => true
  validates :map_x, :presence => true
  validates :map_y, :presence => true
  validates :species_code, :presence => true

  has_many :observations

  def self.search(search)
      if search
        where('species LIKE ? OR species_code LIKE ? OR notes LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
        # find(:all, :joins => :observations, :conditions => ['corals.species LIKE :search OR observations.tag_number LIKE :search', {:search => "%#{search}%"}])
      else
        all
      end
  end  
      
end
