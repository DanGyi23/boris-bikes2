shared_examples_for BikeContainer do
    
    it 'has a default capacity when initialzed' do
        expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can be overridden on initialize' do
        random_capacity = Random.rand(100)
        subject = described_class.new random_capacity
        expect(subject.capacity).to eq random_capacity
    end

    describe 'remove bike' do
        let (:bike) { Bike.new }
        before(:each) { subject.add_bike bike }
    
        it 'returns a bike' do
            expect(subject.remove_bike).to eq bike
        end

        it 'removes a bike from the collection' do
            subject.remove_bike
            expect(subject).to be_empty
        end

        it 'raises an error when empty' do
            subject.remove_bike
            expect { subject.remove_bike }.to raise_error "#{described_class.name} empty"
        end
    end




    describe 'add bike' do
        it 'receives a bike' do
            subject.add_bike double :bike
            expect(subject).not_to be_empty
        end

        it 'raises an error when full' do
            subject.capacity.times { subject.add_bike double(:bike) }
            expect { subject.add_bike double(:bike) }.to raise_error "#{described_class.name} full"
          end
    end
end