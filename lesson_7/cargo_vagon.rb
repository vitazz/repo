class CargoVagon
  attr_reader :vagon_type
  attr_accessor :volume, :taken_volume

  def initialize(volume)
    @vagon_type = 'cargo'
    @volume = volume.to_i
    @taken_volume = 0
  end

  def take_volume(v)
    self.taken_volume += v.to_i
    self.volume = self.volume - v.to_i
    raise 'No free volume in vagon' if @volume == 0
  end

  def free_volume
    self.volume
  end

  def ordered_volume
    self.taken_volume
  end

end