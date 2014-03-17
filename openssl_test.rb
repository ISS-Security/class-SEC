require 'openssl'

# code adapted from: 
#  http://www.ruby-doc.org/stdlib-1.9.3/libdoc/openssl/rdoc/OpenSSL/Cipher.html
def AES_demo(plaintext)
	puts "plaintext: \"#{plaintext}\""

	cipher = OpenSSL::Cipher::AES.new(128, :CBC)
	cipher.encrypt
	key = cipher.random_key
	iv = cipher.random_iv
	puts "symmetric key:\t\t #{key.unpack("H*")}"
	puts "initialization vector:\t #{iv.unpack("H*")}"

	puts "encrypting..."
	ciphertext = cipher.update(plaintext) + cipher.final
	puts "ciphertext: #{ciphertext.unpack("H*")}"

	puts "decrypting..."
	decipher = OpenSSL::Cipher::AES.new(128, :CBC)
	decipher.decrypt
	decipher.key = key
	decipher.iv = iv

	plain = decipher.update(ciphertext) + decipher.final
	puts "original text?: \"#{plain}\""

	puts "match: #{plaintext == plain}" #=> true
end

# code adapted from: 
#  http://ruby-doc.org/stdlib-1.9.3/libdoc/openssl/rdoc/OpenSSL/Digest.html
def SHA256_demo(plaintext)
	sha256 = OpenSSL::Digest::SHA256.new
	digest = sha256.digest(plaintext).unpack("H*")
end