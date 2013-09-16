class FieldtripsController < ApplicationController
  # GET /fieldtrips
  # GET /fieldtrips.json
  def index
    @fieldtrips = Fieldtrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fieldtrips }
    end
  end

  # GET /fieldtrips/1
  # GET /fieldtrips/1.json
  def show
    @fieldtrip = Fieldtrip.find(params[:id])
    # @observations = Observation.
    @corals = Coral.all

    @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/tagged_thumbs/*")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fieldtrip }
    end
  end

  # GET /fieldtrips/new
  # GET /fieldtrips/new.json
  def new
    @fieldtrip = Fieldtrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fieldtrip }
    end
  end

  # GET /fieldtrips/1/edit
  def edit
    @fieldtrip = Fieldtrip.find(params[:id])
  end

  # POST /fieldtrips
  # POST /fieldtrips.json
  def create
    @fieldtrip = Fieldtrip.new(params[:fieldtrip])

    respond_to do |format|
      if @fieldtrip.save
        format.html { redirect_to @fieldtrip, notice: 'Fieldtrip was successfully created.' }
        format.json { render json: @fieldtrip, status: :created, location: @fieldtrip }
      else
        format.html { render action: "new" }
        format.json { render json: @fieldtrip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fieldtrips/1
  # PUT /fieldtrips/1.json
  def update
    @fieldtrip = Fieldtrip.find(params[:id])

    respond_to do |format|
      if @fieldtrip.update_attributes(params[:fieldtrip])
        format.html { redirect_to @fieldtrip, notice: 'Fieldtrip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fieldtrip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fieldtrips/1
  # DELETE /fieldtrips/1.json
  def destroy
    @fieldtrip = Fieldtrip.find(params[:id])
    @fieldtrip.destroy

    respond_to do |format|
      format.html { redirect_to fieldtrips_url }
      format.json { head :no_content }
    end
  end
end
