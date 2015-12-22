require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'passanger_vagon'

class PassangerTrain < Train
  attr_reader :vagon

  def add_vagon(vagon)
    if vagon.class == PassangerVagon
      super
    else
      'Passanger vagons only for passanger trains'
    end
  end

end