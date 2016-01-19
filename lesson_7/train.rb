require_relative 'company_name'

class Train
  include CompanyName
  attr_reader :train_type, :route, :vagons_count, :current_station, :vagons, :vagon_type, :id
  attr_accessor :speed, :number
  @@trains = {}
  @@train_id = 0

  NUMBER_FORMAT = /^[a-z\d]{3}-*[a-z\d]{2}$/i

  def self.find(id)
    puts @@trains[id]
  end

  def initialize(number, type, count)
    @train_type = type
    @vagons_count = count
    @speed = 0
    @number = number
    @@train_id +=1
    @id = @@train_id
    @@trains[id] = self
    @vagons = []
    validate!
  end

  def to_s
    "type:#{@train_type}, vagons:#{@vagons_count}, speed: #{@speed}"
  end

  def increase_speed
    @speed += 10
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def vagons_count
    @vagons_count
  end

  def add_vagon(vagon)
    if train_type == vagon.vagon_type
      if @speed == 0
        @vagons_count += 1
        @vagons << vagon
      else
        'Before add a vagon train should stop'
      end
    else
      raise 'Incorrect vagon type'
    end
  end

  def remove_vagon
    if @speed == 0
      if @vagons_count == 1
        'Vagons count could not be less than 1'
      else
        @vagons_count -= 1
      end
    else
      'Before remove a vagon train should stop'
    end
  end

  def add_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station.add_train(self)
  end

  def next_station
    cur_index = @route.stations.find_index(@current_station)
    @current_station = @route.stations[cur_index + 1]
    @current_station.add_train(self)
    @current_station.name
  end

  def prev_station
    cur_index = @route.stations.find_index(@current_station)
    @current_station = @route.stations[cur_index - 1]
    @current_station.name
  end

  def valid?
    validate!
  rescue
    false
  end

  def each_vagon
    @vagons.each do |a|
      yield
    end
  end


  protected

  def validate!
    raise "Type can't be nil" if @train_type.nil?
    raise "Vagons can't be nil" if @vagons_count.nil?
    raise "Vagons count must be a number" if @vagons_count.class != Fixnum
    raise "Possible train types: cargo, passanger" if @train_type != 'cargo' && @train_type != 'passanger'
    raise "Number has invalid format" if @number !~ NUMBER_FORMAT
    # raise "error" if train_type != vagon.vagon_type
  end
end



