RSpec.describe 'before and after hooks' do
    # a hook is a moment of time during the execution in a test suite, temporarily pause execution and execute a block of code
    before(:context) do # before the entire describe block, not between each test
        puts 'Before context'
    end

    after(:context) do
        puts 'After context'
    end
    
    before(:example) do
        puts 'Before example'
    end

    after(:example) do
        puts 'After example'
    end

    it 'is just a random example' do
        expect(5 * 4).to eq(20)
    end 

    it 'is just a random example' do
        expect(3 - 2).to eq(1)
    end 

end 