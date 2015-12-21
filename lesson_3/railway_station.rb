class RailwayStation
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def show_trains
    cargo_count = 0
    passenger_count = 0
    @trains.each do |train|
      puts train
      train.train_type == 'cargo' ? cargo_count += 1 : passenger_count += 1
    end
    puts "Cargo count is: #{cargo_count}, Passenger count is: #{passenger_count}"
  end

  def send_train
    train = @trains.delete_at(0) if @trains.any?
    train.next_station
  end

  def to_s
    puts "On station #{@name} there are trains:"
    @trains.each do |train|
      puts train
    end
  end
end
