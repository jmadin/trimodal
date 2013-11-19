class ApplicationController < ActionController::Base

  # http_basic_authenticate_with :name => "trimodal", :password => "acropora"

  protect_from_forgery
  include SessionsHelper

  ### CHANGE FOR LOCAL USE
  before_filter :set_path
  def set_path
    @file_path = "/assets/"
    # @file_path = "http://acropora.bio.mq.edu.au/trimodal/"
    # @file_path = "http://montipora.local/trimodal/"
  end  
  
  require 'csv'

  ### EXPORT TAGGED CORAL DATASET
  def export_tagged  
    @all = Observation.find_by_sql("SELECT *, observations.id as obs_id, corals.notes as coral_notes, observations.notes as observation_notes, areas.notes as area_notes FROM observations, corals LEFT OUTER JOIN areas ON observations.id = areas.observation_id WHERE corals.id = observations.coral_id")  
    csv_string = CSV.generate do |csv|   
      csv << ["colony_id", "transect", "map_x", "map_y", "species", "species_code", "observation_id", "fieldtrip_id", "mother_id", "image_tag", "active_tag", "action", "area_id", "photographer_name", "outliner_name", "photo_acceptable", "outline_acceptable", "outline_filename", "area_cm2", "marked", "colony_notes", "observation_notes", "area_notes"]      
      @all.each do |cor|
        fid = cor.fieldtrip_id
        if fid > 5
          fid = fid - 5
        end
        csv << [cor.coral_id, cor.transect, cor.map_x, cor.map_y, cor.species, cor.species_code, cor.obs_id, "F#{fid}", cor.mother_id, cor.tag_number, cor.active_tag, cor.action, cor.id, cor.photographer_name, cor.outliner_name, cor.acceptable, cor.acceptable_outline , cor.outline_filename, cor.area, cor.flag, cor.coral_notes, cor.observation_notes, cor.area_notes]
        end 
    end 
    send_data csv_string, 
        :type => 'text/csv; charset=iso-8859-1; header=present', :stream => true,
        :disposition => "attachment; filename=tagged_#{Date.today.strftime('%Y%m%d')}.csv" 
  end  
  
  
  ### EXPORT CORALS ONLY
  def export_corals
    @all = Observation.find_by_sql("SELECT *, observations.id as obs_id, corals.notes as coral_notes, observations.notes as observation_notes FROM observations, corals WHERE corals.id = observations.coral_id")  
    csv_string = CSV.generate do |csv|   
      csv << ["colony_id", "transect", "map_x", "map_y", "species", "species_code", "observation_id", "fieldtrip_id", "mother_id", "tag_number", "active_tag", "action", "colony_notes", "observation_notes"]      
      @all.each do |cor|
        fid = cor.fieldtrip_id
        if fid > 5
          fid = fid - 5
        end
        csv << [cor.coral_id, cor.transect, cor.map_x, cor.map_y, cor.species, cor.species_code, cor.obs_id, "F#{fid}", cor.mother_id, cor.tag_number, cor.active_tag, cor.action, cor.coral_notes, cor.observation_notes]
        end 
    end 
    send_data csv_string, 
        :type => 'text/csv; charset=iso-8859-1; header=present', :stream => true,
        :disposition => "attachment; filename=corals_#{Date.today.strftime('%Y%m%d')}.csv" 
  end
    
  ### EXPORT SPAWNER DATASET
  def export_spawners
    @spawners = Spawner.all
    csv_string = CSV.generate do |csv|   
      csv << ["spawner_id", "fieldtrip_id", "species", "species_code", "tag_number", "outliner_name", "area_cm2", "spawner_notes"]
      @spawners.each do |spa|
        csv << [spa.id, "F#{spa.fieldtrip_id}", spa.species, spa.species_code, spa.tag_number, spa.outliner_name, spa.area , spa.notes]
      end 
    end 
    send_data csv_string, 
                  :type => 'text/csv; charset=iso-8859-1; header=present', 
                  :disposition => "attachment; filename=spawners_#{Date.today.strftime('%Y%m%d')}.csv" 
  end

  ### EXPORT SIZE STRUCRUE DATA
  def export_size_structure
    @ss = SsCoral.all
    csv_string = CSV.generate do |csv|   
      csv << ["ss_id", "fieldtrip_id", "species", "species_code", "dim_1", "dim_2", "habitat", "outliner_name", "outline_filename", "area_cm2", "ss_notes"]
      @ss.each do |spa|
        csv << [spa.id, "F#{spa.fieldtrip_id}", spa.species, spa.species_code, spa.dim_1, spa.dim_2, spa.habitat, spa.outliner_name, spa.outline_filename, spa.area , spa.notes]
      end 
    end 
    send_data csv_string, 
                  :type => 'text/csv; charset=iso-8859-1; header=present', 
                  :disposition => "attachment; filename=size_structure_#{Date.today.strftime('%Y%m%d')}.csv" 
  end
  
  ### EXPORT FECUNIDTY DATA
  def export_fecundity
    @ff = FecundCoral.all
    csv_string = CSV.generate do |csv|   
      csv << ["fecundity_id", "fieldtrip_id", "species", "species_code", "outliner_name", "outline_filename", "area_cm2", "marked", "fecundity_notes"]
      @ff.each do |spa|
        csv << [spa.id, "F#{spa.fieldtrip_id}", spa.species, spa.species_code, spa.outliner_name, spa.outline_filename, spa.area, spa.flag , spa.notes]
      end 
    end 
    send_data csv_string, 
                  :type => 'text/csv; charset=iso-8859-1; header=present', 
                  :disposition => "attachment; filename=fecundity_#{Date.today.strftime('%Y%m%d')}.csv" 
  end

  # Before filters

  def signed_in_contributor
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_contributor
    @contributor = Contributor.find(params[:id])
    redirect_to(root_url) unless current_contributor?(@contributor)
  end

  def admin_contributor
    redirect_to(root_url) unless current_contributor.admin?
  end

  
  
end
