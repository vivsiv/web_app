class BikeStationsController < ApplicationController
  # GET /bike_stations
  # GET /bike_stations.json
  def index
    location = params[:location] ? params[:location] : "2451 Greenwich St."
    Rails.logger.info location.inspect

    @bike_stations = BikeStation.near(location, 0.5, :order => :distance).limit(5)
    Rails.logger.info "------"
    Rails.logger.info @bike_stations.inspect

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
    @bike_station.update_attributes(params[:bike_station])
  end

  # DELETE /bike_stations/1
  # DELETE /bike_stations/1.json
  def destroy
    @bike_station = BikeStation.find(params[:id])
    @bike_station.destroy
  end
end
