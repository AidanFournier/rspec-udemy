# doubles are great because they return us flexible objects whose methods we can define and whose return values we can then stipulate
# major drawback - forces a pressure on us to make sure our soubles match the behaviour of the objects they're designed to mock; it's up to us to make sure the methods we tell the double to have match the methods that exist on the real class
# RSpec offers us a more stricter alternative called a verifying double; similar to a double, but it verifies that the API/interface of a double matches that of the class or instance it is mocking
# RSpec will check that the methods w'ree stubbing on a double match the names of the instance methods defined on a real life class; if theydon;t exist, it will raise an error

class Person
    def a(seconds)
        sleep(seconds)
        "Hello"
    end 
end 

RSpec.describe Person do
    describe 'regular double' do
        it 'can implement any method' do
            person = double(a: "Hello", b: 20) # this b method doesn't exist on the real Person class, adds a bit of pollution
            expect(person.a).to eq("Hello")
        end
    end

    describe 'instance double' do 
        # this is one example of a verifyiing double, a class or collection of different variables in RSpec that mimic the behaviour of a real life class or instance of a class, and more stricter in their checks
        it 'can only implement methods that are defined on the class' do
            # in this example, we're talking about instance methods that are defined in the class definition
            # person = instance_double(Person, a: "Hello", b: 20)
             # we must pass the class we're mocking as the first argument, and with this we're creating a mock instance of that class (like Person.new)

             person = instance_double(Person)
             allow(person).to receive(:a).with(3).and_return("Hello") # giving 2 arguments will raise an error, #a only has one argument in the real method
             expect(person.a(3)).to eq("Hello")
        end
    end
end