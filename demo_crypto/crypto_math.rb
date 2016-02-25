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
