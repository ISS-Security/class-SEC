require 'openssl'

# code adapted from:
#  http://ruby-doc.org/stdlib-1.9.3/libdoc/openssl/rdoc/OpenSSL/Digest.html
def SHA256_demo(plaintext)
  sha256 = OpenSSL::Digest::SHA256.new
  digest = sha256.digest(plaintext).unpack("H*")
end
