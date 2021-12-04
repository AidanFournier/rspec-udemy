class Card
    attr_accessor :rank, :suit

    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end
end 

RSpec.describe Card do
    
    # 1. One way to reduce repitition
    # before do
    #     @card = Card.new('Ace', 'Spades')
    # end 

    # 2. Another way, creates a new instance of card whenever card is called - good between different examples, but not helpful within one example
    # def card
    #     Card.new('Ace', 'Spades')
    # 
    
    # 3. let
    # - Advantages: btwn diff ex's, each block will be evaluated separately with a brand new card; isolation, no polution
    # - solves last problem - in a single ex, card will ref the same object, card will be memoized/cached
    # - lazy loading - only runs when  we use card, rerducing memory used and time loading
    let(:card) { Card.new('Ace', 'Spades') }


    it 'has a rank and that rank can change' do
        expect(card.rank).to eq('Ace')
        card.rank = 'Queen'
        expect(card.rank).to eq('Queen')
    end

    it 'has a suit' do
        expect(card.suit).to eq('Spades')
    end
end