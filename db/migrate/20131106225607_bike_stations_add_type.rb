class BikeStationsAddType < ActiveRecord::Migration
  def change
    add_column :bike_stations, :type, :string
  end
end
