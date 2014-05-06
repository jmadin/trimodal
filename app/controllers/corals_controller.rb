class CoralsController < ApplicationController
  before_action :signed_in_contributor

  require 'open-uri'


  # GET /corals.json
  helper_method :sort_column, :sort_direction
  
  def index
    @corals = Coral.order(sort_column + " " + sort_direction).search(params[:search])
    @observations = Observation.all
    @areas = Area.all
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corals }
    end
  end


  # GET /corals/1
  # GET /corals/1.json
  def show
    @coral = Coral.find(params[:id])
    @fieldtrips = Fieldtrip.all
    @areas = Area.all

    @files = Dir.glob("app/assets/images/tagged_raw_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coral }
    end
  end

  # GET /corals/new
  # GET /corals/new.json
  def new
    @coral = Coral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coral }
    end
  end

  # GET /corals/1/edit
  def edit
    @coral = Coral.find(params[:id])
  end

  # POST /corals
  # POST /corals.json
  def create
    @coral = Coral.new(coral_params)

    respond_to do |format|
      if @coral.save
        format.html { redirect_to @coral, notice: 'Coral was successfully created.' }
        format.json { render json: @coral, status: :created, location: @coral }
      else
        format.html { render action: "new" }
        format.json { render json: @coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corals/1
  # PUT /corals/1.json
  def update
    @coral = Coral.find(params[:id])

    respond_to do |format|
      if @coral.update_attributes(coral_params)
        format.html { redirect_to @coral, notice: 'Coral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corals/1
  # DELETE /corals/1.json
  def destroy
    @coral = Coral.find(params[:id])
    @coral.destroy

    respond_to do |format|
      format.html { redirect_to corals_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def sort_column
    Coral.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def coral_params
    params.require(:coral).permit(:transect, :map_x, :map_y, :dim_1, :dim_2, :species, :species_code, :notes)
  end

  # t.integer  "transect"
  # t.integer  "map_x"
  # t.integer  "map_y"
  # t.integer  "dim_1"
  # t.integer  "dim_2"
  # t.string   "species"
  # t.string   "species_code"
  # t.text     "notes"
  
end
