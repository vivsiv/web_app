class CreateBikeStations < ActiveRecord::Migration
  def change
    create_table :bike_stations do |t|
      t.string :name, :null => false
      t.string :status, :null => false
      t.integer :spaces, :null => false
      t.references :location

      t.timestamps
    end
  add_index :bike_stations, :name
  add_index :bike_stations, :spaces
  end
end