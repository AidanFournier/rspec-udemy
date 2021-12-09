RSpec.describe 'equality matchers' do
    let(:a) { 3.0 }
    let(:b) { 3 }

    describe 'eq matcher' do
        it 'tests for value and ignores type' do
            expect(a).to eq(3)
            expect(b).to eq(3.0)
            expect(a).to eq(b)
        end
    end

    describe 'eql matcher' do
        it 'tests for the value, including same type' do
            expect(a).not_to eql(3)
            expect(b).not_to eql(3.0)
            expect(a).not_to eql(b)

            expect(a).to eql(3.0)
            expect(b).to eql(3)
        end
    end

    describe 'equal and be matcher' do
        # difference between equality (ex. two houses that look/function the same) and identity (ex. two totally distinct houses that have same floor plan, address)
        # identity == the same object in computer memory
        # equality == the two things look the same
        # think of variable as the address to a house, and the thing it's pointing to as the house
        #, below, [1, 2, 3] is the house, c is the address
        # c and d are equal houses, but not identical 
        # c and e are different addresses pointing to the same house (therefore equal)
        let(:c) { [1, 2, 3] }
        let(:d) { [1, 2, 3] }
        let(:e) { c }

        it 'cares about object identity' do
            expect(c).to eq(d)
            expect(c).to eql(d)

            expect(c).to equal(e)
            # expect(c).to equal(d)
            expect(c).to be(e)

            expect(c).not_to equal(d)
            expect(c).not_to equal([1, 2, 3]) # this is a new array, new object, so not the same as c
        end
    end

end