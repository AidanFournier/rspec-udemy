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
        end
        # it doesn't matter what these methods are doing when we're testing the movie class, we just need them available
    end 
end 

actor = Actor.new("Brad Pitt")
movie = Movie.new(actor)
movie.start_shooting

# these two are so connected, how can we test them in isolation?