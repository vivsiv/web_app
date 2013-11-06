require 'digest'
require 'open-uri'
require 'net/http'
#require 'oauth'

class BikeStationsService
  def self.get_bike_stations
    url = "http://data.sfgov.org/resource/w969-5mn4.json"
    uri = URI::parse(url)

    response = Net::HTTP.get_response(uri)
    Rails.logger.info "Getting bike stations for #{Date.today}"
    Rails.logger.info response
    ActiveSupport::JSON.decode(response.body)
  end

  def self.create_bike_stations(data)
    data.each do |station_data|
      address = station_data['yr_inst'] == "None" ? station_data['location_name'] : station_data['yr_inst']
      longitude = station_data['coordinates']['longitude'].to_f
      latitude = station_data['coordinates']['latitude'].to_f

      location = Location.find_or_create_by_address({
        'address' => address,
        'longitude' => longitude,
        'latitude' => latitude
      })
      Rails.logger.info "created/updated location: #{location.inspect}"

      name = station_data['location_name'] == "_undetermined" ? "Unknown" : station_data['location_name']
      station_type = station_data['placement'].downcase.gsub("_", " ")
      status = station_data['status'].downcase.gsub("_", " ")
      spaces = station_data['spaces'].to_i

      bike_station = BikeStation.new({
        :name => name,
        :station_type => station_type,
        :status => status,
        :spaces => spaces
      })

      bike_station.location = location
      bike_station.save!
      Rails.logger.info "created bike station: #{bike_station.inspect}"
    end
  end

  # def update_bike_stations
  #   data = get_bike_stations
  #   data.each do |station_data|

  #   end
  # end

end