# instance_double method accepts a class as the 1st arg and creates an RSpec double that checks to make sure the methods put on the double match the real instance methods of the class
# but what about mocking class methods? Allows us to mock a class, not an instance of the class
# beneficial if you want to mock class methods

class Deck
    def self.build
        # business logic to build a whole bunch of cards
    end 
end 

class CardGame
   attr_reader :cards

    def start
        @cards = Deck.build
    end 
end

# in this spec, our goal is to test our CardGame class, which relies on the Deck class
# when we test the CardGame class, we don't need to care what the business logic is within the Deck class, we just need the #build class method invoked on that class

RSpec.describe CardGame do
    it 'can only implement class methods that are defined on a class' do
        # class_double(Deck, build: ['Ace', 'Queen'], shuffle: ['Queen', 'Ace']) # shuffle method will throw up an error if we didn't have it in the real class

        deck_klass = class_double(Deck, build: ['Ace', 'Queen']).as_stubbed_const # by putting quotes around 'Deck', we don't need to have built the Deck class yet for this to work
        # as_stubbed_const ensures that every time we use Deck throughout the test, it's going to replace all calls to Deck with this class double - very important


        expect(deck_klass).to receive(:build)
        subject.start
        expect(subject.cards).to eq(['Ace', 'Queen'])
    end
end