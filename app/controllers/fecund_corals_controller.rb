class FecundCoralsController < ApplicationController
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

    @files = Dir.glob("/Users/jmadin/Dropbox/web/trimodal/fecundity_thumbs/*")

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
    @fecund_coral = FecundCoral.new(params[:fecund_coral])
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
      if @fecund_coral.update_attributes(params[:fecund_coral])
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
end
