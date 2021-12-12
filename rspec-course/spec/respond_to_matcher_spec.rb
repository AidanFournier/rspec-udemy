# allows us to verify that an object can respond to a given method

class HotChocolate
    def drink
        'Delicious'
    end 

    def discard
        'PLOP!'
    end 

    def purchase(number)
        "Awesome, I just purchased #{number} more hot chocolate beverages!"
    end 
end 

RSpec.describe HotChocolate do
    it 'confirms that an object can respond to a method' do
        # the symbols represent the methods we want to check for that exist on that instance
        expect(subject).to respond_to(:drink)
        expect(subject).to respond_to(:drink, :discard)
        expect(subject).to respond_to(:drink, :discard, :purchase)
    end

    # always better to be more explicit (:purchase)
    it 'confirms an object can respond to a method with arguments' do
        expect(subject).to respond_to(:purchase)
        expect(subject).to respond_to(:purchase).with(1).arguments
    end

    it { is_expected.to respond_to(:purchase, :discard) }
    it { is_expected.to respond_to(:purchase).with(1).arguments }
end

# polymorphism: we as developers shouldn't care so much about what objects we're dealing with,. what class it comes from - we should care more about what an object can respond to, what methods it has on it, what messages it can return and accept values from
# it woulnd;t make sense to have a drink method for hot choco and a consume methdo for coffee, they're doing the same thing
# many shapes - we don't care about the shape of something (ex. hot chocolate or coffee), as long as the instance can respond to a given metho0dl, we can invoke that method on it
# makes program more rubust and reliable, simple, cleaner, similar in design

# class Coffee
#     def drink; end
#     def discard; end
#     def purchase(number); end 
# end 