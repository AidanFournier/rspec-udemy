class Actor
    def initialize(name)
      @name = name
    end

    def ready?
        sleep(3)
        true
    end 

    def act
        "I love you, baby"
    end

    def fall_off_ladder
        "Call my agent, no way!"
    end 

    def light_on_fire
        false
    end 
end 

class Movie
    attr_reader :actor

    def initialize(actor)
        @actor = actor
    end 

    def start_shooting
        if actor.ready?
            puts actor.act
            puts actor.fall_off_ladder
            puts actor.light_on_fire
            puts actor.act
        end
        # it doesn't matter what these methods are doing when we're testing the movie class, we just need them available
    end 
end 

# actor = Actor.new("Brad Pitt")
# movie = Movie.new(actor)
# movie.start_shooting

# these two are so connected, how can we test them in isolation? Look at line 37
# we can use our double to replace the actor model and all its inner logic

RSpec.describe Movie do
    # wanto to give the double method the same methods in the real class
    let(:stuntman) { double("Mr. Danger", ready?: true, act: 'Any string at all', fall_off_ladder: 'Sure, lets do it', light_on_fire: true) }
    # here we've created an object that greatly resembles an actor
    # we're faking the ready method to simply return truee, and makes test much quicker

    subject { described_class.new(stuntman) }

    describe '#start_shooting method' do
        it 'expects an actor to do 3 actions' do
            # expect(stuntman).to receive(:ready?)
            # expect(stuntman).to receive(:act)
            # expect(stuntman).to receive(:fall_off_ladder)
            # expect(stuntman).to receive(:light_on_fire)
            
            # write expections before actually invoking the method on the Movie class
            
            # inside Movie class we've now added a second Actor#act method within #start_shooting, and our test above doesn't actually count how many times we use #act

            # expect(stuntman).to receive(:light_on_fire).once # adds additional qualifier, if it's invoked more than once the test will fail
            # expect(stuntman).to receive(:light_on_fire).exactly(1).times
            expect(stuntman).to receive(:light_on_fire).at_most(1).times
            # expect(stuntman).to receive(:act).twice
            # expect(stuntman).to receive(:act).exactly(2).times
            expect(stuntman).to receive(:act).at_least(2).times

            subject.start_shooting
        end
    end
end