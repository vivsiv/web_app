class BikeStationAddLocation < ActiveRecord::Migration
  def change
    add_column :bike_stations, :address, :string
    add_column :bike_stations, :latitude, :float
    add_column :bike_stations, :longitude, :float
    add_index :bike_stations, :address
  end
end
