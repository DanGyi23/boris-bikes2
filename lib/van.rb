require "./lib/boris_bikes"
require "./lib/bike"

class Van
attr_reader :bikes
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def collect_from_dock(dock)
    @bikes << dock.broken_bikes
    @bikes = @bikes.flatten
  end

  def repair_at_garage
    @bikes.map { |bike| bike.report_repaired }
  end

  def distribute_to_docking_station(dock)
    @bikes.length.times do
      dock.bikes << @bikes.pop
    end
  end

end
