require_relative 'instance_counter'
class RailwayStation
  include InstanceCounter
  @@instances = []

  attr_reader :name, :trains, :train_type
  def initialize(name)
    @name = name
    @train_type = train_type
    @trains = []
    @@instances << self
    register_instance
  end

  def self.all
    puts @@instances.inspect
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

  def send_train(train)
    sendentrain = @trains.delete(train) if @trains.any?
    sendentrain.next_station
  end

  def to_s(train_type)
    puts "On station #{@name} there are trains:"
    @trains.each do |train|
      puts train if train.train_type == train_type
    end
  end
end
