require 'openssl'

def hash_sha256(plaintext)
  sha256 = OpenSSL::Digest::SHA256.new
  digest = sha256.digest(plaintext).unpack("H*")
end
