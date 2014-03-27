require './crypto_math.rb'
require './modular_arithmetic.rb'

class KnapsackCipher
	M = 41
	N = 491
	DEF_SUPER = SuperKnapsack.new([2, 3, 7, 14, 30, 57, 120, 251])
	DEF_GENERAL = DEF_SUPER.to_general(M, N)

	def self.encrypt(plaintext, generalknap=DEF_GENERAL)

	end

	def self.decrypt(cipherarray, superknap=DEF_SUPER, m=M, n=N)

	end

end


# Test it out!
sup = SuperKnapsack.new([2, 3, 7, 14, 30, 57, 120, 251])

carray = KnapsackCipher.encrypt("Hello World!", sup.to_general(41, 491))
KnapsackCipher.decrypt(carray, sup, 41, 491)