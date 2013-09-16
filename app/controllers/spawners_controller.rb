class SpawnersController < ApplicationController
  # GET /spawners
  # GET /spawners.json

  # helper_method :sort_column, :sort_direction

  def index
    @spawners = Spawner.all
    # @spawners = Spawner.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spawners }
    end
  end

  # GET /spawners/1
  # GET /spawners/1.json
  def show
    @spawner = Spawner.find(params[:id])

    @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/spawned_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spawner }
    end
  end

  # GET /spawners/new
  # GET /spawners/new.json
  def new
    @spawner = Spawner.new
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spawner }
    end
  end

  # GET /spawners/1/edit
  def edit
    @spawner = Spawner.find(params[:id])
    @fieldtrips = Fieldtrip.all
  end

  # POST /spawners
  # POST /spawners.json
  def create
    @spawner = Spawner.new(params[:spawner])
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @spawner.save
        format.html { redirect_to @spawner, notice: 'Spawner was successfully created.' }
        format.json { render json: @spawner, status: :created, location: @spawner }
      else
        format.html { render action: "new" }
        format.json { render json: @spawner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spawners/1
  # PUT /spawners/1.json
  def update
    @spawner = Spawner.find(params[:id])
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      if @spawner.update_attributes(params[:spawner])
        format.html { redirect_to @spawner, notice: 'Spawner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spawner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spawners/1
  # DELETE /spawners/1.json
  def destroy
    @spawner = Spawner.find(params[:id])
    @spawner.destroy

    respond_to do |format|
      format.html { redirect_to spawners_url }
      format.json { head :no_content }
    end
  end
end
