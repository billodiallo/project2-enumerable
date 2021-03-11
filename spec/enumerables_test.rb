require_relative '../enumerable.rb'

describe Enumerable do
    describe '#my_each' do
        it 'returns an enumerater unless a block is given' do
            check = [3,6,7].my_each 
            result = check.is_a?(Enumerator)
            expect(result).to eq(true) 
        end
        it 'returns an enumerater unless a block is given' do
            check = 
            expect([3,6,7].my_each {|x| x } ).to eq([3,6,7]) 
        end
    end
end