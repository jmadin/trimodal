class FecundCoralsController < ApplicationController
  before_action :signed_in_contributor
  # GET /fecund_corals
  # GET /fecund_corals.json
  def index
    @fecund_corals = FecundCoral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fecund_corals }
    end
  end

  # GE T /fecund_corals/1
  # GET /fecund_corals/1.json
  def show
    @fecund_coral = FecundCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all

    # @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/fecundity_thumbs/*")
    @files = Dir.glob("app/assets/images/fecundity_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fecund_coral }
    end
  end

  # GET /fecund_corals/new
  # GET /fecund_corals/new.json
  def new
    @fecund_coral = FecundCoral.new
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fecund_coral }
    end
  end

  # GET /fecund_corals/1/edit
  def edit
    @fecund_coral = FecundCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all
  end

  # POST /fecund_corals
  # POST /fecund_corals.json
  def create
    @fecund_coral = FecundCoral.new(fecund_coral_params)
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @fecund_coral.save
        format.html { redirect_to @fecund_coral, notice: 'Fecund coral was successfully created.' }
        format.json { render json: @fecund_coral, status: :created, location: @fecund_coral }
      else
        format.html { render action: "new" }
        format.json { render json: @fecund_coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fecund_corals/1
  # PUT /fecund_corals/1.json
  def update
    @fecund_coral = FecundCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @fecund_coral.update_attributes(fecund_coral_params)
        format.html { redirect_to @fecund_coral, notice: 'Fecund coral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fecund_coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fecund_corals/1
  # DELETE /fecund_corals/1.json
  def destroy
    @fecund_coral = FecundCoral.find(params[:id])
    @fecund_coral.destroy

    respond_to do |format|
      format.html { redirect_to fecund_corals_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def fecund_coral_params
    params.require(:fecund_coral).permit(:fieldtrip_id, :species, :species_code, :dim_1, :dim_2, :habitat, :outliner_name, :outline_filename, :area, :flag, :notes)
  end
  
    # 
    # t.integer  "fieldtrip_id"
    # t.string   "species"
    # t.string   "species_code"
    # t.integer  "dim_1"
    # t.integer  "dim_2"
    # t.string   "habitat"
    # t.string   "outliner_name"
    # t.string   "outline_filename"
    # t.decimal  "area"
    # t.boolean  "flag"
    # t.text     "notes"
    # 
end
