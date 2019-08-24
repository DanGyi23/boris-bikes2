## BORIS BIKES PROGRAM

This Ruby program is designed to mimic the functionality of the London Boris Bikes, "communal" bikes that live in docking-stations around London. Users can:

- Release bikes `.release_bike` - applies to Docking Station instances - note, if there are no working bikes available, the user won't be able to release a bike
- Report a bike as broken `.report_broken` - applies to Bike instances
- Check if a bike is broken `.broken?` - applies to Bike instances
- Dock a bike in the docking station (whether broken or working) `.dock` - applies to DockingStation instances
- Send a van to collect the broken bikes from a dock `.collect_from_dock(name_of_your_dock_instance_here)` - applies to Van instances
- Have the broken bikes repaired whilst at the garage `.repair_at_garage` - applies to Van instances
- Have the repaired bikes distributed back to a docking station `.distribute_to_docking_station(name_of_your_dock_instance_here)` - applies to Van instances

#### Instance Creation
1. Create a new docking station
`variable = DockingStation.new`
2. Create a new bike
`variable = Bike.new`
3. Create a new van
`variable = Van.new`
