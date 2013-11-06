class BikeStation < ActiveRecord::Base
  attr_accessible :name, :station_type, :status, :spaces
  belongs_to :location
  validates :name, :status, :presence => true
end
