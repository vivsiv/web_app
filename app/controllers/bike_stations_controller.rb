class BikeStationsController < ApplicationController
  # GET /bike_stations
  # GET /bike_stations.json
  def index
    if params[:current_location]

    else
      @current_location = nil
    end

    @bike_stations = BikeStation.where(:location => 1).limit(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bike_stations }
    end
  end

  # GET /bike_stations/1
  # GET /bike_stations/1.json
  def show
    @bike_station = BikeStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bike_station }
    end
  end

  # GET /bike_stations/new
  # GET /bike_stations/new.json
  def new
    @bike_station = BikeStation.new()
  end

  # GET /bike_stations/1/edit
  def edit
    @bike_station = BikeStation.find(params[:id])
  end

  # POST /bike_stations
  # POST /bike_stations.json
  def create
    @bike_station = BikeStation.new(params[:bike_station])
    @bike_station.save!
  end

  # PUT /bike_stations/1
  # PUT /bike_stations/1.json
  def update
    @bike_station = BikeStation.find(params[:id])

    respond_to do |format|
      if @bike_station.update_attributes(params[:bike_station])
        format.html { redirect_to @bike_station, notice: 'Bike station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bike_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bike_stations/1
  # DELETE /bike_stations/1.json
  def destroy
    @bike_station = BikeStation.find(params[:id])
    @bike_station.destroy

    respond_to do |format|
      format.html { redirect_to bike_stations_url }
      format.json { head :no_content }
    end
  end
end
