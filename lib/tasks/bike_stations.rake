namespace :bike_stations do
  desc "seed bike stations"
  task :seed_bike_stations => :environment do |t|
    puts "getting bike stations"
    data = BikeStationsService.get_bike_stations
    puts "seeding bike stations"
    BikeStationsService.create_bike_stations(data)
  end

  # desc "update bike stations"
  # task :update_bike_stations => :environment do |t|
  #   puts "deleting stations that no longer exist"

  #   puts "creating new stations"
  # end
end