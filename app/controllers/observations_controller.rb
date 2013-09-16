class ObservationsController < ApplicationController


  
  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.search(params[:osearch])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @observations }
    end
  end

  # GET /observations/1
  # GET /observations/1.json
  def show

    @observation = Observation.find(params[:id])
    @coral = Coral.find(params[:coral_id])

    @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/tagged_thumbs_outlines/*")
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @observation }
    end
  end

  # GET /observations/new
  # GET /observations/new.json
  def new
    @observation = Observation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @observation }
    end
  end

  # GET /observations/1/edit
  def edit
    @coral = Coral.find(params[:coral_id])
    @observation = @coral.observations.find(params[:id])
  end

  # POST /observations
  # POST /observations.json
  def create
    # @observation = Observation.new(params[:observation])

    @coral = Coral.find(params[:coral_id])
    @observation = @coral.observations.create(params[:observation])

    respond_to do |format|
      if @observation.save
        format.html { redirect_to coral_path(@coral), notice: 'The observation was successfully created.' }
        format.json { render json: @observation, status: :created, location: @observation }
      else
        format.html { redirect_to coral_path(@coral), notice: '*The observation was NOT created. Please make sure the fieldtrip ID is a number and unique.' }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /observations/1
  # PUT /observations/1.json
  def update
    @observation = Observation.find(params[:id])

    respond_to do |format|
      if @observation.update_attributes(params[:observation])
        format.html { redirect_to coral_path(@observation.coral), notice: 'Observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    # @observation = Observation.find(params[:id])
    # @observation.destroy

    @coral = Coral.find(params[:coral_id])
    @observation = @coral.observations.find(params[:id])
    @observation.destroy
    # redirect_to coral_path(@coral)
        
    respond_to do |format|
      format.html { redirect_to coral_path(@coral) }
      format.json { head :no_content }
    end
  end
end
