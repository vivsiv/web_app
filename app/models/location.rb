class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  has_many :bike_stations
  validates :address, :uniqueness => true, :allow_nil => false
  validates :address, :latitude, :longitude, :presence => true

  geocoded_by :address

  after_validation :geocode, if: :no_coordinates

  private
    def no_coordinates
      self[:latitude].nil? || self[:longitude].nil?
    end
end
