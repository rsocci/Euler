# If we list all the natural numbers below 10 that are multiples of 3 or 5
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

require_relative 'test_helper'

class MultipleFinder
  attr_accessor :num, :multiples

  def initialize(num)
    @num = num
    @multiples = []
  end

  def multiples_of_num
    num.times do |n|
      multiples << n if (n % 3 == 0 || n % 5 == 0) && n != 0
    end
    multiples
  end

  def add_multiples
    multiples_of_num
    multiples.inject { |sum, multiple| sum + multiple }
  end
end

describe MultipleFinder do
  let(:multiple_finder) { MultipleFinder.new(10) }

  describe 'when given the number 10' do
    it 'should return the sum of 23' do
      multiple_finder.add_multiples.must_equal(23)
    end
  end

 describe '#multiples_of_num' do
    it 'should return all multiples of three and five' do
      multiple_finder.multiples_of_num.must_equal([3, 5, 6, 9])
    end
  end
end

multiple_finder = MultipleFinder.new(1000)
puts multiple_finder.add_multiples
