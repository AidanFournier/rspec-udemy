RSpec.describe 'shorthand syntax' do
    subject { 5 }

    context 'with classic syntax' do
        it 'should equal 5' do
            expect(subject).to eq(5)
        end
    end

    context 'with one-liner syntax' do
        it { is_expected.to eq(5) }
    end

    # is_expected works with subject, but not let
    # don't need provide string to it
    # is_expected replaces expect(subject)
end