require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'passanger_train'
require_relative 'cargo_train'

begin
  s1 = RailwayStation.new('tver')
  s2 = RailwayStation.new('msk')
  s3 = RailwayStation.new('spb')
  t1 = PassangerTrain.new('ss1-21', 'passanger', 2)
  t2 = CargoTrain.new('ss1-21', 'cargo', 3)
  v1 = PassangerVagon.new(54)
  v2 = CargoVagon.new(100)
  r1 = Route.new(s1, s2, s3)
  t1.add_vagon(v2)
  s1.add_train(t1)
  s2.add_train(t2)
  t1.add_vagon(v1)
  t2.add_vagon(v2)
rescue RuntimeError => e
  puts e.inspect
end

s1.each_train { |t| puts t.to_s }
s1.each_train { |t| t.each_vagon { |v| puts v.to_s } }
s2.each_train { |t| t.each_vagon { |v| puts v.to_s } }

