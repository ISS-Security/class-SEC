require './crypto_math.rb'
require './modular_arithmetic.rb'

class KnapsackCipher
	# Default values of knapsacks, primes
	M = 41
	N = 491
	DEF_SUPER = SuperKnapsack.new([2, 3, 7, 14, 30, 57, 120, 251])
	DEF_GENERAL = DEF_SUPER.to_general(M, N)

	# Returns an encrypted array of integers given a plaintext and general knapsack array
	# Params:
	# - plaintext: String object to be encrypted
	# - generalknap: Array object containing general knapsack numbers
	# Returns:
	# - Array of encrypted numbers
	def self.encrypt(plaintext, generalknap=DEF_GENERAL)
		# TODO: implement this method
	end

	# Returns an decrypted String given an encrypted Array of numbers, SuperKnapsack, and prime numbers
	# Params:
	# - cipherarray: Array of encrypted numbers
	# - superknap: SuperKnapsack object
	# - m: prime number
	# - n: prime number
	# Returns:
	# - String of plain text
	def self.decrypt(cipherarray, superknap=DEF_SUPER, m=M, n=N)
		raise(ArgumentError, "Argument should a SuperKnapsack object") unless superknap.is_a? SuperKnapsack

		# TODO: implement this method
	end

end


# Test it out!
sup = SuperKnapsack.new([2, 3, 7, 14, 30, 57, 120, 251])

carray = KnapsackCipher.encrypt("Hello World!", sup.to_general(41, 491))
KnapsackCipher.decrypt(carray, sup, 41, 491)