module BikeContainer

    attr_reader :capacity
    DEFAULT_CAPACITY = 20
    

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
        @broken_bikes = []
    end

    def add_bike(bike)
        raise "#{self.class.name} full" if full?
        bikes << bike
    end

    def empty?
        bikes.empty?
    end

    def full?
        bikes.count >= capacity
    end

    def remove_bike
        raise "#{self.class.name} empty" if empty?
        bikes.pop
    end
    
    attr_reader :bikes

end