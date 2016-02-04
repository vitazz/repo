class Ticket < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true
  validates :seat, presence: true, uniqueness: true

  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: "RailwayStation", foreign_key: :start_station_id
  belongs_to :final_station, class_name: "RailwayStation", foreign_key: :final_station_id
end
