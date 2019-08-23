require "./lib/boris_bikes"
require "./lib/bike"

class Van

attr_reader :garage

  def initialize
    @garage = []
  end

  def collect_from_dock
    # error here. Need to extract the instance variable for each instance of DockingStation
    broken_bikes = @bikes.dup - (@bikes.delete_if { |bike| bike.broken? })
    (@garage << broken_bikes).flatten
  end

  def repair_at_garage
    @garage.map { |bike| bike.report_repaired }
  end

  def distribute_to_docking_station
      @garage # then find a way to return each of these values to docking station
  end

end
