class Fixnum
  def factorial
    (1..self).reduce(:*) || 1
  end

  # demo method -- perhaps just use .to_s(2) in regular use
  def to_bi
    self.to_s(2)
  end
end

class String
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

  # copied from: https://github.com/emonti/rbkb/blob/a6d35c0fd785bae135034502b1d07ed626aebde5/lib/rbkb/extends/string.rb#L163
  def entropy
    e = 0
    sz = self.bytesize.to_f
    b = self.bytes
    0.upto(255) do |i|
      x = b.count(i)/sz
      if x > 0
        e += - x * (Math.log(x)/Math.log(2))
      end
    end
    e
  end
end

def entropy(str)
  e = 0
  sz = str.bytesize.to_f
  b = str.bytes
  0.upto(255) do |i|
    x = b.count(i)/sz
    if x > 0
      e += - x * (Math.log(x)/Math.log(2))
    end
  end
  e
end
