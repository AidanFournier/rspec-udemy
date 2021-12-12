# allows us to check whether an object has a given set of attributes along with their values
# check whether these attributes are available and whether they match what you expect

class ProfessionalWrestler
    attr_reader :name, :finishing_move

    def initialize(name, finishing_move)
        @name = name
        @finishing_move = finishing_move
    end 
end 

RSpec.describe 'have_attrbutes matcher' do
    describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do
        it 'checks for object attributes and proper values' do
            expect(subject).to have_attributes(name: 'Stone Cold Steve Austin')
            expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
        end

        it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner') }
    end 
end