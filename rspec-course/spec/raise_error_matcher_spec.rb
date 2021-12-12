# make RSpec check for the presence of an exception or an error

RSpec.describe 'raise_error matcher' do
    
    def some_method
        x # this is a random character, Ruby doesn't know what to do with it, and it will raise a name error
    end 

    class CustomError < StandardError; end 

    # it 'can check for any error' do
    #     # use curly brackets so Ruby knows that this is an expeected error and the whole test suite wont break
    #     expect { some_method }.to raise_error
    #     # this isn't so great actually, because it isn;t specific and an unrelated error mgiht be causing this to pass
    #     # we need to be more specific
    # end

    it 'can check for a specific error being raised' do
        # instead, we pass raise_error an argument of what we want it to check for
        expect { some_method }.to raise_error(NameError)
        expect { 10 / 0 }.to raise_error(ZeroDivisionError)
    end

    it 'can check for a user-created error' do
        expect { raise CustomError }.to raise_error(CustomError)
    end
end 