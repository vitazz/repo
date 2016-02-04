class Route < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  # has_and_belongs_to_many :railway_stations
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
end
