require_relative 'instance_counter'
class RailwayStation
  include InstanceCounter
  @@stations = []

  attr_reader :name, :trains, :train_type, :vagons
  def initialize(name)
    @name = name
    @train_type = train_type
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def self.all
    @@stations.inspect
  end

  def add_train(train)
    @trains << train
  end

  def show_trains
    cargo_count = 0
    passenger_count = 0
    @trains.each do |train|
      # puts train
      train
      train.train_type == 'cargo' ? cargo_count += 1 : passenger_count += 1
    end
    # puts "Cargo count is: #{cargo_count}, Passenger count is: #{passenger_count}"
    cargo_count
    passenger_count
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

  def each_train
    @trains.each do |train|
      yield
    end
  end

  def show_list
    @@stations.each do |a|
      puts a.trains
    end
  end

  def vagons_list
    number = 1
    @trains.each do |train|
      train.vagons.each do |vagon|
        puts "Vagon number: #{number}, vagon type: #{vagon.vagon_type}"
        number += 1
        if vagon.class == PassangerVagon
          puts "Free places: #{vagon.places}, ordered places: #{vagon.taken_places}"
        else
          puts "Free volume: #{vagon.volume}, ordered volume: #{vagon.taken_volume}"
        end
      end
    end
  end

  protected
  def validate!
    raise "Name of station can't be nil" if @name.nil?
  end
end
