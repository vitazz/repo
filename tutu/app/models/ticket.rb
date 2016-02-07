class Ticket < ActiveRecord::Base

  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: "RailwayStation", foreign_key: :start_station_id
  belongs_to :final_station, class_name: "RailwayStation", foreign_key: :final_station_id

  validates :number, presence: true, uniqueness: true
  validates :seat, presence: true, uniqueness: { scope: :train_id }
end
