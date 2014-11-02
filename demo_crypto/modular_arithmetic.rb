# Found at: https://gist.github.com/jingoro/2388745  (March 20, 2014)
# Some modular arithmetic helper methods useful for number theory or
# cryptography.
#
# # Examples
#
# Compute the greatest common denominator of 114 and 48:
#
#     gcd(114, 48) #=> 6
#
# Compute `a` and `b` such that `a*x + b*y = gcd(x, y)`:
#
#     g, a, b = gcdext(3, 5)
#     g #=> 1
#     a #=> 2
#     b #=> -1
#
# Compute the inverse of 4 modulo 7:
#
#     invert(4, 7) #=> 2
#
# Compute 3 raised to 4 modulo 5:
#
#     powmod(3, 4, 5) #=> 1
#
module ModularArithmetic
  
  module_function
  
  # Returns the greatest common denominator of `x` and `y`.
  #
  # @param [Integer] x
  # @param [Integer] y
  # @return [Integer]
  def gcd(x, y)
    gcdext(x, y).first
  end
  
  # Returns an array of the form `[gcd(x, y), a, b]`, where
  # `ax + by = gcd(x, y)`.
  #
  # @param [Integer] x
  # @param [Integer] y
  # @return [Array<Integer>]
  def gcdext(x, y)
    if x < 0
      g, a, b = gcdext(-x, y)
      return [g, -a, b]
    end
    if y < 0
      g, a, b = gcdext(x, -y)
      return [g, a, -b]
    end
    r0, r1 = x, y
    a0 = b1 = 1
    a1 = b0 = 0
    until r1.zero?
      q = r0 / r1
      r0, r1 = r1, r0 - q*r1
      a0, a1 = a1, a0 - q*a1
      b0, b1 = b1, b0 - q*b1
    end
    [r0, a0, b0]
  end
  
  # Returns the inverse of `num` modulo `mod`.
  #
  # @param [Integer] num the number
  # @param [Integer] mod the modulus
  # @return [Integer]
  # @raise ZeroDivisionError if the inverse of `base` does not exist
  def invert(num, mod)
    g, a, b = gcdext(num, mod)
    unless g == 1
      raise ZeroDivisionError.new("#{num} has no inverse modulo #{mod}")
    end
    a % mod
  end
  
  # Returns `base` raised to `exp` modulo `mod`.
  #
  # @param [Integer] base the base
  # @param [Integer] exp the exponent
  # @param [Integer] mod the modulus
  # @return [Integer]
  # @raise ZeroDivisionError if the `exp` is negative and the inverse
  #   of `base` does not exist
  def powmod(base, exp, mod)
    if exp < 0
      base = invert(base, mod)
      exp = -exp
    end
    result = 1
    multi = base % mod
    until exp.zero?
      result = (result * multi) % mod if exp.odd?
      exp >>= 1
      multi = (multi * multi) % mod
    end
    result
  end

end
