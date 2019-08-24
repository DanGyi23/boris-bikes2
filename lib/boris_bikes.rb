require "./lib/van"
require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if @bikes[-1].broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    add_bike bike
  end

  def broken_bikes
    @broken_bikes << @bikes.select { |bike| bike.broken? }
    @bikes.delete_if { |bike| bike.broken? }
    @broken_bikes = @broken_bikes.flatten
  end

end
