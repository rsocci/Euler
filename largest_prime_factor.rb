# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143

require_relative 'test_helper'
require 'prime'
require 'benchmark'

class Integer
  def find_prime_factors
    primes = []

    self.downto(1) do |n|
      if n.prime? && self % n == 0
        primes << n
        break
      end
    end
    primes
  end

  def largest_prime_factor
    self.find_prime_factors.last
  end
end

num = 13195
puts Benchmark.measure {num.largest_prime_factor}

describe 'Integer' do
  let (:number) { 13195 }
  context 'finds prime factors' do
    it 'should return 5, 7, 13, and 29' do
      number.find_prime_factors.must_equal([29])
    end
  end
  context '#largest_prime_factor' do
    it 'should return 29' do
      number.largest_prime_factor.must_equal 29
    end
  end
end
