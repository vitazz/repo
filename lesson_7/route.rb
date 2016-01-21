class Route
  attr_reader :first_station, :last_station, :stations

  def initialize(first, last, *list)
    @first_station = first
    @last_station = last
    @stations = list
    @stations.insert(0, first)
    @stations.push(last)
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  # def to_s
  #   stations.each do |station|
  #     puts station
  #   end
  # end

  protected
  def validate!
    raise "First station can't be nil" if @first_station.nil?
    raise "Last station can't be nil" if @last_station.nil?
    raise "Only stations can be added to route" if @first_station.class != RailwayStation || @last_station.class != RailwayStation
  end
end
