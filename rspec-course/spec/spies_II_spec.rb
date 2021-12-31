# the allow syntax allows us to spy on a specific method

class Car
    def initialize(model)
        @model = model
    end 
end 

class Garage
    attr_reader :storage
    
    def initialize
        @storage = []
    end 

    def add_to_collection(model)
        @storage << Car.new(model)
    end 
end 

RSpec.describe Garage do
    # there are two dependencies on the car class
    # one, we invoke Car.new, we want to fake this class
    # and we also want to fake what it returns, the instance, we don't want to use a real car instance

    let(:car) { instance_double(Car) }

    before do
        allow(Car).to receive(:new).and_return(car) # we intercepted the real #new method, just return the mock double of an instance of Car
    end

    it 'adds a car to its storage' do
        subject.add_to_collection('Honda Civic')
        expect(Car).to have_received(:new).with('Honda Civic')
        expect(subject.storage.length).to eq(1)
        expect(subject.storage.first).to eq(car)
    end
end