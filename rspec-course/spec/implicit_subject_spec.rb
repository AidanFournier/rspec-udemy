RSpec.describe Hash do
    # let(:my_hash) { {} }
    # le(:subject) { Hash.new }
    # subject == Hash.new

    it 'should start off empty' do
        puts subject
        puts subject.class
        expect(subject.length).to eq(0)
    end

end