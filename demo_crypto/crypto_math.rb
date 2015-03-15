require 'Prime'

module CryptoMath
  refine Fixnum do
    def factorial
      (1..self).reduce(:*) || 1
    end

    # demo method -- perhaps just use .to_s(2) in regular use
    def to_bi
      self.to_s(2)
    end
  end

  refine String do
    def binary_op(other)
      throw :mismatchedStringLengths unless self.length == other.length
      other_a = other.unpack("U*")
      self.unpack("U*").map.with_index do |s, i|
        yield s, other_a[i]
      end.pack("U*")
    end

    def ^(other)
      binary_op(other) {|a, b| a^b}
    end

    def &(other)
      binary_op(other) {|a, b| a&b}
    end

    def |(other)
      binary_op(other) {|a, b| a|b}
    end

    # Returns string as an array of ascii numbers in binary
    def to_bi_a
      self.chars.map {|c| c.ord.to_s(2)}
    end

    # modified from: https://gist.github.com/geoffgarside/747242
    def word_entropy
      len = self.chars.count.to_f
      log2 = Math.log(2)

      counts = self.chars.inject({}) do |h,c|
        h[c] = (h[c] || 0) + 1
        h
      end

      counts.inject(0) do |entropy, pair|
        frequency = (pair[1] / len)
        entropy = (frequency * (Math.log(frequency) / log2))
      end.abs
    end
  end
end

class SuperKnapsack < Array

  def self.array_sum(arr)
    arr.reduce (:+)
  end

  def initialize(arr)
    arr.each.with_index do |a, i|
      unless i==0
        if (a <= self.class.array_sum(arr[0..i-1])) then
          raise(ArgumentError, "not superincreasing at index #{i}")
        end
      end
      self.clear
      self.concat arr
    end
  end

  def primes?(m,n)
    return Prime.prime?(m) && Prime.prime?(n)
  end

  def to_general(m, n)
    argError = "arguments must both be prime" if (!primes?(m,n))
    argError = "#{n} is smaller than superincreasing knapsack" if n <= self.last
    raise(ArgumentError, argError) unless argError.nil?
    self.map {|a| (a*m)%n }
  end
end
