require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'cargo_vagon'

class CargoTrain < Train
  attr_reader :vagon

  def add_vagon(vagon)
    if vagon.class == CargoVagon
      super
    else
      'Cargo vagons only for cargo trains'
    end
  end
end
