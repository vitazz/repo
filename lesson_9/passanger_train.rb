require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'passanger_vagon'

class PassangerTrain < Train
  def initialize(number, type, count)
    super
    @train_type = 'passanger'
  end
end
