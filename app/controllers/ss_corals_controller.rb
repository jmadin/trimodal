class SsCoralsController < ApplicationController
  # GET /ss_corals
  # GET /ss_corals.json
  def index
    @ss_corals = SsCoral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_corals }
    end
  end

  # GET /ss_corals/1
  # GET /ss_corals/1.json
  def show
    @ss_coral = SsCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all

    @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/size_structure_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_coral }
    end
  end

  # GET /ss_corals/new
  # GET /ss_corals/new.json
  def new
    @ss_coral = SsCoral.new
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_coral }
    end
  end

  # GET /ss_corals/1/edit
  def edit
    @ss_coral = SsCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all
  end

  # POST /ss_corals
  # POST /ss_corals.json
  def create
    @ss_coral = SsCoral.new(ss_coral_params)
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @ss_coral.save
        format.html { redirect_to @ss_coral, notice: 'Ss coral was successfully created.' }
        format.json { render json: @ss_coral, status: :created, location: @ss_coral }
      else
        format.html { render action: "new" }
        format.json { render json: @ss_coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ss_corals/1
  # PUT /ss_corals/1.json
  def update
    @ss_coral = SsCoral.find(params[:id])
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @ss_coral.update_attributes(ss_coral_params)
        format.html { redirect_to @ss_coral, notice: 'Ss coral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_coral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_corals/1
  # DELETE /ss_corals/1.json
  def destroy
    @ss_coral = SsCoral.find(params[:id])
    @ss_coral.destroy

    respond_to do |format|
      format.html { redirect_to ss_corals_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def ss_coral_params
    params.require(:ss_coral).permit(:fieldtrip_id, :species, :species_code, :dim_1, :dim_2, :habitat, :outliner_name, :outline_filename, :area, :notes)
  end

  # t.integer  "fieldtrip_id"
  # t.string   "species"
  # t.string   "species_code"
  # t.integer  "dim_1"
  # t.integer  "dim_2"
  # t.string   "habitat"
  # t.string   "outliner_name"
  # t.string   "outline_filename"
  # t.decimal  "area"
  # t.text     "notes"

end
