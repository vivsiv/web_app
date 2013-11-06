class BikeStationsTypeToStationType < ActiveRecord::Migration
  def change
    rename_column :bike_stations, :type, :station_type
  end
end
