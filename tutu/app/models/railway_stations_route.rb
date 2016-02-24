class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route
  scope :ordered, -> { order(:number) }

  validates :railway_station_id, uniqueness: { scope: :route_id }
end