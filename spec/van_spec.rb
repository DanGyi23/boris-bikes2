require "van"
require "bike"
require "boris_bikes"

describe Van do

    let(:bike) { Bike.new }
    let(:dockingstation) { DockingStation.new }


    it "responds to collect_from_dock" do
      expect(subject).to respond_to(:collect_from_dock)
    end

    it "responds to repair_at_garage" do
      expect(subject).to respond_to(:repair_at_garage)
    end

    it "responds to distribute_to_docking_station" do
      expect(subject).to respond_to(:distribute_to_docking_station)
    end

    it "removes the broken bikes from the dock(@bikes) using collect_from_dock" do
      bike.report_broken
      dockingstation.dock(bike)
      subject.collect_from_dock(dockingstation)
      expect(dockingstation.bikes).to eq([])
    end

    it "adds bikes to garage" do
      bike.report_broken
      dockingstation.dock(bike)
      subject.collect_from_dock(dockingstation)
      expect(subject.bikes).to eq([bike])
    end

    it "responds to repair_at_garage" do
      expect(subject).to respond_to(:repair_at_garage)
    end

    it "makes @broken == false for a broken bike (i.e. repairs a bike)" do
      bike.report_broken
      dockingstation.dock(bike)
      subject.collect_from_dock(dockingstation)
      subject.repair_at_garage
      expect(subject.bikes.pop.broken?).to eq(false)
    end

    it "returns repaired bikes to the docking station" do
    bike.report_broken
    dockingstation.dock(bike)
    subject.collect_from_dock(dockingstation)
    subject.repair_at_garage
    subject.distribute_to_docking_station(dockingstation)
    expect(dockingstation.bikes[-1].broken?).to eq(false)
  end


end
