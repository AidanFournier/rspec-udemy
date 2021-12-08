RSpec.describe Array do
    it 'should start off empty' do
        expect(subject.length).to eq(0)
        subject << 'Hello there'
        expect(subject.length).to eq(1)
    end
end