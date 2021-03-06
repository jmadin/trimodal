class TouchesController < ApplicationController
  before_action :signed_in_contributor
  # GET /touches
  # GET /touches.json
  def index

    @coral = Coral.find(params[:coral_id])
    @observation = Observation.find(params[:observation_id])
    @area = Area.find(params[:area_id])

    @touches = @area.touches.find(params[:area_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @touches }
    end
  end


  # def export
      
  #   if signed_in?
  #     @touches = Touch.joins{measurements}.where{measurements.trait_id.in my{params[:checked]}}
  #   end        
    
  #   csv_string = CSV.generate do |csv|
  #     csv << ["observation_id", "access", "enterer", "coral", "location_name", "latitude", "longitude", "resource_id", "measurement_id", "trait_name", "standard_unit", "value", "precision", "precision_type", "precision_upper", "replicates"]
  #     @observations.each do |obs|
  #       if params[:global].blank? || obs.location_id == 1
  #         obs.measurements.each do |mea|
  #           if !params[:ancillary].blank? | params[:checked].include?(mea.trait_id.to_s)
  #             if obs.location.present?
  #               loc = obs.location.location_name
  #               lat = obs.location.latitude
  #               lon = obs.location.longitude
  #               if obs.location.id == 1
  #                 lat = ""
  #                 lon = ""
  #               end
  #             else
  #               loc = ""
  #               lat = ""
  #               lon = ""
  #             end
  #             if obs.private == true
  #               acc = 0
  #             else
  #               acc = 1
  #             end
  #             csv << [obs.id, acc, obs.user_id, obs.coral.coral_name, loc, lat, lon, obs.resource_id, mea.id, mea.trait.trait_name, mea.standard.standard_unit, mea.value, mea.precision, mea.precision_type, mea.precision_upper, mea.replicates]
  #           end
  #         end
  #       end
        
  #     end
  #   end

  #   send_data csv_string, 
  #     :type => 'text/csv; charset=iso-8859-1; header=present', :stream => true,
  #     :disposition => "attachment; filename=ctdb_#{Date.today.strftime('%Y%m%d')}.csv"
          
  # end





  # GET /touches/1
  # GET /touches/1.json
  def show

    @touch = Touch.find(params[:id])

    @area = Area.find(params[:area_id])
    @observation = Observation.find(params[:observation_id])
    @coral = Coral.find(params[:coral_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @touch }
    end
  end

  # GET /touches/new
  # GET /touches/new.json
  def new

    @coral = Coral.find(params[:coral_id])
    @observation = Observation.find(params[:observation_id])
    @area = Area.find(params[:area_id])
    @touch = @area.touches.create(params[:touch])


    # @touch = Touch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @touch }
    end
  end

  # GET /touches/1/edit
  def edit

    # @observation = Observation.find(params[:observation_id])
    @area = Area.find(params[:area_id])
    @touch = @area.touches.find(params[:id])


    # @touch = Touch.find(params[:id])
  end

  # POST /touches
  # POST /touches.json
  def create

    @area = Area.find(params[:area_id])
    @touch = @area.touches.create(touch_params)

    # @touch = Touch.new(params[:touch])

    # respond_to do |format|
    #   if @touch.save
    #     format.html { redirect_to @touch, notice: 'Touch was successfully created.' }
    #     format.json { render json: @touch, status: :created, location: @touch }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @touch.errors, status: :unprocessable_entity }
    #   end
    # end


    # @observation = Observation.find(params[:observation_id])
    # @area = @observation.areas.create(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to coral_observation_area_path(@area.observation.coral, @area.observation, @area), notice: 'The area was successfully created.' }
        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { redirect_to coral_observation_area_path(@area.observation.coral, @area.observation, @area), notice: '*The touch was NOT created.  You must enter a unique and positive touch number corresponding with your touch points.' }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end



  end

  # PUT /touches/1
  # PUT /touches/1.json
  def update
    @touch = Touch.find(params[:id])

    respond_to do |format|
      if @touch.update_attributes(touch_params)
        format.html { redirect_to coral_observation_area_path(@touch.area.observation.coral, @touch.area.observation, @touch.area), notice: 'Touch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @touch.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /touches/1
  # DELETE /touches/1.json
  def destroy
    # @observation = Observation.find(params[:observation_id])
    @area = Area.find(params[:area_id])
    @touch = @area.touches.find(params[:id])


    # @touch = Touch.find(params[:id])
    @touch.destroy

    respond_to do |format|
      format.html { redirect_to coral_observation_area_path(@area.observation.coral, @area.observation, @area), notice: 'Area was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  
  def touch_params
    params.require(:touch).permit(:area_id, :outliner_name, :outline_filename, :taxon1, :taxon2, :touch_type, :length, :flag, :notes, :touch_number, :growth_form)
  end

  # t.integer  "area_id"
  # t.string   "outliner_name"
  # t.string   "outline_filename"
  # t.string   "taxon1"
  # t.string   "taxon2"
  # t.string   "touch_type"
  # t.decimal  "length"
  # t.boolean  "flag"
  # t.text     "notes"
  # t.datetime "created_at",       :null => false
  # t.datetime "updated_at",       :null => false
  # t.integer  "touch_number"
  # t.string   "growth_form"

end




