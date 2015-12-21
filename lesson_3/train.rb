class Train
  attr_reader :train_type, :route, :vagons_count, :current_station
  attr_accessor :speed

  def initialize(type, count)
    @train_type = type
    @vagons_count = count
    @speed = 0
  end

  def to_s
    "type:#{@train_type}, vagons:#{@vagons_count}, speed: #{@speed}"
  end

  def increase_speed
    @speed += 10
    'Speed increased by 10'
  end

  def current_speed
    "Current speed is #{@speed}"
  end

  def stop
    @speed = 0
  end

  def vagons_count
    "Current count of vagons is #{@vagons_count}"
  end

  def add_vagon
    if @speed == 0
      @vagons_count += 1
    else
      'Before add a vagon train should stop'
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
    "Next station is #{@current_station.name}"
  end

  def prev_station
    cur_index = @route.stations.find_index(@current_station)
    @current_station = @route.stations[cur_index - 1]
    "Previous station is #{@current_station.name}"
  end
end
