class Train < ActiveRecord::Base

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vagons

  validates :number, presence: true, uniqueness: true

  # validates :vagons, uniqueness: {
  # scope: :number,
  # message: "К поезду не могут быть прикреплены вагоны с одинаковым номером"
  # }



end
