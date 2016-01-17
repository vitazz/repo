require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'passanger_train'
require_relative 'cargo_train'

begin
s1 = RailwayStation.new('tver')
s2 = RailwayStation.new('msk')
s3 = RailwayStation.new('spb')
t1 = PassangerTrain.new('ss1-21','passanger', 2)
t2 = CargoTrain.new('ss1-21','cargo', 3)
v1 = PassangerVagon.new
v2 = CargoVagon.new
r1 = Route.new(s1, s2, s3)
t1.add_vagon(v2)
rescue RuntimeError => e
  puts e.inspect
end