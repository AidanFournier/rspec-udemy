RSpec.describe 'matching arguments' do
    it 'can return different values depending on the argument' do
        three_element_array = double # [1, 2, 3]

        allow(three_element_array).to receive(:first).with(no_args).and_return(1) # with allows us to specify exactly what argument we expect to get and what to return in the case of that argument being provided
        allow(three_element_array).to receive(:first).with(1).and_return([1]) # here, with(1) literally means the number 1 is being given as an argument (just like arr.first(1), which would return [1])
        allow(three_element_array).to receive(:first).with(2).and_return([1, 2]) # of course, these return numbers are completely arbitrary because the values in the double are a figment of our imagination, double is just mocking the behaviour of a real 3-element array
        allow(three_element_array).to receive(:first).with(be >= 3).and_return([1, 2, 3]) # we've now completely replicated the behaviour of using the #first method on a 3-element array, without actually having that array

        expect(three_element_array.first).to eq(1)
        expect(three_element_array.first(1)).to eq([1])
        expect(three_element_array.first(2)).to eq([1, 2])
        expect(three_element_array.first(3)).to eq([1, 2, 3])
        expect(three_element_array.first(100)).to eq([1, 2, 3])
    end
end