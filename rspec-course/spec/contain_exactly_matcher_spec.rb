# this method doesn't care about the order of the elements, just checking to see that they're present in an array
# if there are extra elements in an array, the test will fail, and if there are not enough elements, the test will fail

RSpec.describe 'contain_exactly matcher' do
    subject { [1, 2, 3] }

    describe 'long form syntax' do
        it 'should check for the presence of all elements' do
            expect(subject).to contain_exactly(1, 2, 3)
            expect(subject).to contain_exactly(3, 2, 1)
            expect(subject).to contain_exactly(2, 3, 1)

            # expect(subject).to contain_exactly(1, 2)
            # expect(subject).to contain_exactly(1, 2, 3, 4)
        end
    end

    it { is_expected.to contain_exactly(1, 2, 3) }
    it { is_expected.to contain_exactly(3, 1, 2) }

end