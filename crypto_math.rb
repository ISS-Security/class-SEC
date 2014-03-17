# Adds a factorial function to Ruby's Integer object
# code from: http://rosettacode.org/wiki/Factorial#Ruby
class Integer
	def factorial
		(1..self).reduce(:*) || 1
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

	def &(other)
		binary_op(other) {|a, b| a|b}
	end

	def unpack_bi()
		self.unpack("U*").map {|i| i.to_s(2)}
	end
end

