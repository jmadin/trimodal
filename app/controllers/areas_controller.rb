class AreasController < ApplicationController
  before_action :signed_in_contributor
  # GET /areas
  # GET /areas.json
  def index

    @coral = Coral.find(params[:coral_id])
    @observation = Observation.find(params[:observation_id])
    @areas = @observation.areas.find(params[:observation_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas }
    end
  end

  # GET /areas/1
  # GET /areas/1.json
  def show

    @area = Area.find(params[:id])
    @observation = Observation.find(params[:observation_id])
    @coral = Coral.find(params[:coral_id])

    @files = Dir.glob("app/assets/images/tagged_touch_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.json
  def new

    @coral = Coral.find(params[:coral_id])
    @observation = Observation.find(params[:observation_id])
    @area = @coral.areas.create(params[:area])


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/1/edit
  def edit

    @observation = Observation.find(params[:observation_id])
    @area = @observation.areas.find(params[:id])

  end

  # POST /areas
  # POST /areas.json
  def create

    @observation = Observation.find(params[:observation_id])
    @area = @observation.areas.create(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to coral_observation_path(@observation.coral, @observation), notice: 'The area was successfully created.' }
        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { redirect_to coral_observation_path(@observation.coral, @observation), notice: '*The area was NOT created.  You must enter outliner name AND the outlined filename.' }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /areas/1
  # PUT /areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(area_params)
        format.html { redirect_to coral_observation_path(@area.observation.coral, @area.observation), notice: 'Area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy

    @observation = Observation.find(params[:observation_id])
    @area = @observation.areas.find(params[:id])

    @area.destroy

    respond_to do |format|
      format.html { redirect_to coral_observation_path(@observation.coral, @observation), notice: 'Area was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def area_params
    params.require(:area).permit(:observation_id, :outliner_name, :outline_filename, :area, :flag, :notes, :photographer_name, :acceptable, :acceptable_outline)
  end
  
  # t.integer  "observation_id"
  # t.string   "outliner_name"
  # t.string   "outline_filename"
  # t.decimal  "area"
  # t.boolean  "flag"
  # t.text     "notes"
  # t.datetime "created_at",         :null => false
  # t.datetime "updated_at",         :null => false
  # t.string   "photographer_name"
  # t.boolean  "acceptable"
  # t.boolean  "acceptable_outline"
  
end
