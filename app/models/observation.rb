class Observation < ActiveRecord::Base

  # validates :fieldtrip_id, :uniqueness => true, :on => :create
  validates :fieldtrip_id, :presence => true
  validates :tag_number, :presence => true
  validates :action, :presence => true

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
  
  def self.to_csv
    CSV.generate do |csv|
      
      @all = Observation.find_by_sql("SELECT *, observations.id as obs_id, corals.notes as coral_notes, observations.notes as observation_notes FROM observations, corals WHERE corals.id = observations.coral_id")  
      
      # csv << column_names
      @all.each do |obs|
        csv << obs.attributes.values_at(*column_names)
      end
    end
  end
  
end

