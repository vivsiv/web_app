class BikeStation < ActiveRecord::Base
  attr_accessible :name, :station_type, :status, :spaces
  attr_accessible :address, :latitude, :longitude
  validates :name, :status, :address, :latitude, :longitude, :presence => true
  validates :address, :uniqueness => true, :allow_nil => false

  geocoded_by :address

  after_validation :geocode, if: :no_coordinates

  private
    def no_coordinates
      self[:latitude].nil? || self[:longitude].nil?
    end
end
