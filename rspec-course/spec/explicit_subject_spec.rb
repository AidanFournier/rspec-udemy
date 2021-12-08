RSpec.describe Hash do
    # let(:bob) { {a: 1, b: 2} }
    # one advantage over let is that you can use aliases like bob and specific shorthand RSpce syntax we haven't explored yet
    # you can custom exactly what the subject represents
    subject(:bob) do
        { a: 1, b: 2 }
    end

    it 'has two key-value pairs' do
        expect(subject.length).to eq(2)
        expect(bob.length).to eq(2)
    end
    
    describe 'nested exmaple' do
        it 'has two key-value pairs' do
            expect(subject.length).to eq(2)
            expect(bob.length).to eq(2)
        end
    end
end