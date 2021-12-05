RSpec.describe 'nested hooks' do
    before(:context) do
        puts 'OUTER Before context'
    end

    before(:example) do
        puts 'OUTER Before example'
    end

    it 'does basic math' do
        expect(1 + 1).to eq(2)
    end

    context 'with condition A' do
        before(:context) do
            puts 'INNER Before context'
        end
    
        before(:example) do
            puts 'INNER Before example'
        end

        it 'does some more basic math' do
            expect(1 + 1).to eq(2)
        end

        it 'does subtraction as well' do
            expect(5 - 3).to eq(2)
        end
    end
end

# Expected output:
# OUTER Before context
# OUTER Before example
# does basic math
# INNER Before context
# INNER Before example
# does some more basic math
# INNER Before example
# does subtraction as well


# K
# Z
# E
# Z
# E
# H
# Z
# B
# E
# Z
# B
# V

RSpec.describe 'multi context hooks' do
    before(:context) do
      puts 'K'
    end
   
    before(:example) do
      puts 'Z'
    end
   
    after(:example) do
      puts 'E'
    end
   
    it 'can multiply' do
      expect(3 * 7).to eq(21)
    end
   
    it 'can divide' do
      expect(40 / 8).to eq(5)
    end
   
    context 'with some criteria' do
      before(:context) do
        puts 'H'
      end
   
      before(:example) do
        puts 'B'
      end
   
      it 'can subtract' do
        expect(10 - 5).to eq(5)
      end
   
      context 'in this condition' do
        before(:example) do
          puts 'V'
        end
   
        it 'can add' do
          expect(8 + 6).to eq(14)
        end
      end
    end
  end