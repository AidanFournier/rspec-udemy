RSpec.describe 'allow method review' do
    it 'can customize return value for methods on doubles' do
        calculator = double
        allow(calculator).to receive(:add).and_return(15) # by default, RSpec will give #add a return value of nil
        # expect(calculator.add).to be_nil
        expect(calculator.add).to eq(15)
        expect(calculator.add(-2, -3)).to eq(15) #doesn't matter what we pass to the #add method, since it has no real business logic behind it
    end

    it 'can stub one or more methods on a real object' do
        arr = [1, 2, 3]
        allow(arr).to receive(:sum).and_return(10) # this overrides the already established #sum method for arrays
        # you can use it to skip the complex business logic of the real thing
        expect(arr.sum).to eq(10)

        arr.push(4)
        expect(arr).to eq([1, 2, 3, 4])
    end

    it 'can return multiple return values in sequence' do
        # I want to mimic a real-life array object
        # [:b, :c]
        # I want to mimic the pop method (removes and returns last element in the array)
        # I want to mimic this behaviour in a double

        mock_array = double
        allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
        expect(mock_array.pop).to eq(:c)
        expect(mock_array.pop).to eq(:b)
        expect(mock_array.pop).to be_nil
        expect(mock_array.pop).to be_nil
        expect(mock_array.pop).to be_nil
    end
end