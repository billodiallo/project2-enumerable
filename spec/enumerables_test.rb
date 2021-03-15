require_relative '../enumerable'

describe Enumerable do
  describe '#my_each' do
    it 'returns an enumerator unless a block is given' do
      check = [3, 6, 7].my_each
      result = check.is_a?(Enumerator)
      expect(result).to eq(true)
    end
    it 'returns an enumerator unless a block is given' do
      expect([3, 6, 7].my_each { |x| x }).to eq([3, 6, 7])
    end
  end

  describe '#my_each_with_index' do
    it 'returns an enumerator unless a block is given' do
      expect([5, 2, 7, 3].my_each_with_index).to be_a Enumerator
    end
    it 'retuns index and item after every iteration' do
      hash = {}
      menu = %w[chicken beef pasta fruit]
      menu.my_each_with_index do |item, index|
        hash[item] = index
      end
      expect(hash).to eq({ 'chicken' => 0, 'beef' => 1, 'pasta' => 2, 'fruit' => 3 })
    end
  end

  describe '#my_select' do
    it 'returns an enumerator unless a block is given' do
      expect([1, 3, 5, 7].my_select).to be_a Enumerator
    end
    it 'returns the items that meet a given condition' do
      expect((1..10).my_select(&:even?)).to eq([2, 4, 6, 8, 10])
    end
  end

  describe '#my_all?' do
    it 'returns true if all the words are equal to or greater than three' do
      expect(%w[cat dog bear].my_all? { |i| i.length >= 3 }).to eq(true)
    end
    it 'returns false if all the words are equal to or greater than four' do
      expect(%w[cat dog bear].my_all? { |i| i.length >= 4 }).to eq(false)
    end
    it 'returns true if all input are numeric' do
      expect([2, 2i, 5, 13].my_all?).to eq(true)
    end
    it 'returns true if all input have a true value' do
      expect([13, true, nil].my_all?).to eq(false)
    end
    it 'returns true if all the elements match a specific pattern' do
      expect(%w[cat dog bear].my_all?(/a/)).to eq(false)
      expect(%w[cat bag bear].my_all?(/a/)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'returns true if any of the elements length exceeds 4' do
      expect(%w[cat dog bear].my_any? { |word| word.length >= 4 }).to eq(true)
    end
    it 'returns true if any of the elements meet a specific pattern' do
      expect(%w[cat dog bear].my_any?(/t/)).to eq(true)
      expect(%w[cat dog bear].my_any?(/z/)).to eq(false)
    end
    it 'returns true if any of the input have a true value' do
      expect([13, true, nil].my_any?).to eq(true)
    end
    it 'returns false if the array is empty' do
      expect([].my_any?).to eq(false)
    end
    it 'returns true if the array consists of an interger' do
      expect([13, true, nil].my_any?).to eq(true)
    end
  end

  describe '#my_none' do
    it 'returns true if the array is empty' do
      expect([].my_none?).to eq(true)
    end
    it 'returns true if no word has a word length of 5' do
      expect(%w[cat dog bear].my_none? { |word| word.length == 5 }).to eq(true)
    end
    it 'returns true when none of the element has /z/' do
      expect(%w[cat dog bear].my_none?(/z/)).to eq(true)
    end
  end

  describe '#my_count' do
    it 'returns the length of the array' do
      expect([1, 3, 5, 7].my_count).to eql([1, 3, 5, 7].count)
    end
  end

  describe '#my_map' do
    it 'returns a block if no enumerator is given' do
      expect([1, 3, 5, 7].my_map).to be_a Enumerator
    end
    it 'returns a new array while adding the value of the yield' do
      expect([2, 3, 5, 7].my_map { |i| i * 2 }).to eq([4, 6, 10, 14])
    end
  end

  describe '#my_inject' do
    it 'returns the sum of elments in an array/range' do
        expect((1..5).my_inject {|sum, i| sum + i}).to eq(15)
    end
    it 'returns the longest string in an array' do
        my_array  = ['cat', 'dog', 'bear'].my_inject do |memo, word|
            memo.length > word.length ? memo : word
        end
        expect(my_array).to eq('bear')
    end
  end

  describe '#multiply_els' do
    it 'multiplies all the elements of the array' do
        expect(multiply_els([3, 6, 7])).to eql(126)
    end
  end
end
