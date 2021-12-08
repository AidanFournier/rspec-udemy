RSpec.describe Array do
    subject(:sally) do
        [1, 2]
    end

    # it 'caches the object within an example'
    it 'can change the length of the array' do
        expect(sally.length).to eq(2)
        sally.pop
        expect(sally.length).to eq(1)
    end

    # 'creates a new object for a new example'
    it 'is equal to the original array' do
        expect(sally.length).to eq(2)
    end
end