class BikeStationsDropLocationId < ActiveRecord::Migration
  def change
    remove_column :bike_stations, :location_id
  end
end
