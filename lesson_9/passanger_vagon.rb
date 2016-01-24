class PassangerVagon
  attr_reader :vagon_type, :taken_places
  attr_accessor :places
  @@id = 0
  def initialize(places)
    @places = places.to_i
    @vagon_type = 'passanger'
    @taken_places = 0
    @@id += 1
  end

  def take_place
    self.places -= 1
    self.taken_places += 1
    fail 'All places was ordered' if @places == 0
  end

  def free_places
    self.places
  end

  def ordered_places
    self.taken_places
  end

  def to_s
    "Vagon number: #{@@id}, free places: #{@places}, ordered places: #{@taken_places}, vagon_type: #{@vagon_type}"
  end
end
