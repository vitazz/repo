require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'cargo_vagon'

class CargoTrain < Train

  def initialize(type, count)
    super
    @train_type = 'cargo'
  end

end
