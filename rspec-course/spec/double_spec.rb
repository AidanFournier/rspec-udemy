# mock: to replace a real thing with a simulated version; to emulate something
# sometimes the program is too complex to test one single element
# integration tests: where we test the entire system as a whole
# unit tests: targeting one specific function of the program
# if we have a program with 5 closely connected objects, we want to test that as a whole but also each object separately
# we can do this by emulating the other 4 objects while testing 1; replace the real life objects with fake versionss that behave similarily
# movie-set double, stand-in

RSpec.describe 'a random double' do
    it 'only allows defined mtheods to be invoked' do
        # # One option for syntax:
        # stuntman = double("Mr. Danger", fall_off_ladder: 'Ouch', light_on_fire: true) # this is the stuntman on the set, the stand-in. After the first argument which is the identifier, we can pass in a hash, inside the keys represent the method names, the values represent the return values for those methods
        # # hash brackets not needed if last argument passed
        # expect(stuntman.fall_off_ladder).to eq('Ouch')
        # expect(stuntman.light_on_fire).to eq(true)

        # # 2 option for syntax:
        # stuntman = double("Mr. Danger")
        # allow(stuntman).to receive(:fall_off_ladder).and_return('Ouch')
        # expect(stuntman.fall_off_ladder).to eq('Ouch')

        # # 3 option, combining the two
        stuntman = double("Mr. Danger")
        allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
        expect(stuntman.fall_off_ladder).to eq('Ouch')
        expect(stuntman.light_on_fire).to eq(true)
    end
end
