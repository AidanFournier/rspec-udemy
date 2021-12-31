# how are spies different than doubles?
# spies are an alternative type of test double, they follow a dlightly different pattern when it comes to testing 
# when creating a double, we create it and give it a message, and then we would expect the double to recieve the message, before we invoked the method that might send that message to the double
# so we wrote our expectation before the fact, before we actually did anything with our object or class under test
# in comparison, spie follow a different testing pattern, where we asseertt he messge has been received after the fact, after the ctiion actually occurs, after the method hass been invoked
# double method places the expectation before the action, while spies place the expectation after the action
# different paradigm, diffrent way of thinking about how we write our tests
# adv. of spies; they automatically spy/observe all of the messages that are ssnet to an object, even if we haven;t explicitly defiendn that mesage
# on a double we have to explicitly state that you have these available methods and we expect these methods to be invoked
# spies will automatically keep track of messages received without us telling it which messages to expect to receives

RSpec.describe 'spies' do
    let(:animal) { spy('animal') }
    # so thsi is now very much like a double, its a fake object that will keep track of all the messages that it receives

    it 'confims that a message has been received' do
        # if this were a double:
        # expect(animal).to receive(:eat_food)
        # animal.eat_food

        # for a spy, we switch it:
        animal.eat_food
        expect(animal).to have_received(:eat_food) #past tense
        expect(animal).not_to have_received(:eat_human)
    end

    it 'resets between examples' do
        expect(animal).not_to have_received(:eat_food)
    end

    it 'retains the same functionality of a regular double' do
        animal.eat_food
        animal.eat_food
        animal.eat_food('Sushi')
        expect(animal).to have_received(:eat_food).exactly(3).times
        expect(animal).to have_received(:eat_food).at_least(2).times
        expect(animal).to have_received(:eat_food).with('Sushi')
        expect(animal).to have_received(:eat_food).once.with('Sushi')

    end
end