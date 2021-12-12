RSpec.describe 'start_with and end-with matcher' do
    describe 'caterpillar' do
        it 'should check for a substring at the beginnng or end' do
            expect(subject).to start_with('cat')
            expect(subject).to end_with('pillar')
            # watch out for case sensitivity
        end

        it { is_expected.to start_with('cat') }
        it { is_expected.to end_with('pillar') }\
    end

    describe [:a, :b, :c, :d] do
        it 'should check for elements at beginning or end of the array' do
            expect(subject).to start_with(:a)
            expect(subject).to start_with(:a, :b, :c)
            expect(subject).to end_with(:d)
            expect(subject).to end_with(:c, :d)
        end 

        it { is_expected.to start_with(:a, :b) }
    end
end