class Route < ActiveRecord::Base

  # has_and_belongs_to_many :railway_stations
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    self.title = "#{railway_stations.first.title} -  #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать хотя бы 2 станции")
    end
  end

end