#A palindromic number reads the same both ways. The largest palindrome made
#from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.
require_relative 'test_helper'

class TargetNumber
  def self.largest_palindrome_product(num, target)
    num.downto(1) do |n|
      if n.palindrome?
       factors = n.find_factors(target)
       return factors if factors
      end
    end
  end
end

class Integer
  def palindrome?
    self.to_s == self.to_s.reverse
  end

  def find_factors(target)
    countdown_start = ('9' * target).to_i
    countdown_start.downto(1) do |n|
      result = self % n
      second_factor = self / n
      if result == 0 && (n.to_s.length == target && second_factor.to_s.length == target)
        return [n, second_factor]
      end
    end
    false
  end
end

describe Integer do
  let(:number) { 9009 }
  context '#palindrome?' do
    it 'should return whether the number is a palindrome' do
      number.palindrome?.must_equal true
    end
  end
  context '#find_factors' do
    it 'should return 91 and 99' do
      number.find_factors(2).must_equal [99, 91]
    end
  end
end

describe TargetNumber do
  let(:number) { 998001 }
  context '.largest_palindrome_product' do
    it 'should return 9009' do
      TargetNumber.largest_palindrome_product(number, 2).must_equal [99, 91]
    end
  end
end
