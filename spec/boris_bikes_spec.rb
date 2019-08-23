require "boris_bikes"

describe DockingStation do

      let(:bike) {double :bike}

  it "responded to release_bike method" do
    expect(subject).to respond_to(:release_bike)
  end

  it "responds to dock" do
    expect(subject).to respond_to(:dock)
  end

  it "dock takes an argument" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "allows user to set the capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
      it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it "check bikes at docking station" do
    allow(bike).to receive(:dock).and_return([bike])
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike)}
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end

    it 'accepts a bike if it is broken' do
      allow(bike).to receive(:report_broken)
      expect { subject.dock(bike) }.not_to raise_error
    end
  end

  describe '#release_bike' do
    it 'raises an error when there no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases a bike' do
      allow(bike).to receive(:dock)
      allow(bike).to receive(:release_bike).and_return(bike)
    end

    it 'does not release a broken bike' do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:dock)
      allow(bike).to receive(:release_bike).and_return('Bike is broken')
    end
  end

end
