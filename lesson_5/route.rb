class Route
  attr_reader :first_station, :last_station, :stations

  def initialize(first, last, *list)
    @first_station = first
    @last_station = last
    @stations = list
    @stations.insert(0, first)
    @stations.push(last)
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def to_s
    stations.each do |station|
      puts station
    end
  end
end
