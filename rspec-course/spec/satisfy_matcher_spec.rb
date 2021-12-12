# allow us to create our own assertions and expectations, check for a custom condition to be met

RSpec.describe 'satisfy matcher' do
    # subject { 'racecar' }
    subject { 'racecars' }

    # how can we make an assertion that checks if a string is a palindrome? No built-in method for this in RSpec

    it 'is a palindrome' do
        expect(subject).to satisfy { |value| value == value.reverse }
    end

    # always better to pass the satify method a descriptive string to tell us exactly what it is, makes it read more human
    it 'can accept a custom error message' do
        expect(subject).to satisfy('be a palindrome') do |value|
            value == value.reverse
        end
    end
end