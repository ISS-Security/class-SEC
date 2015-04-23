require 'rbnacl/libsodium'

## Encryption

key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
# => "\xE3\xEB\xDDh?\xEC\x06\xF3>\xD3o\x14t\x94\xE3h\xC4\xAD\xCE\xB6PgJ0\x99Q\xAC<\xA1\xA4\x9E\x9D"

secret_box = RbNaCl::SecretBox.new(key)
# => #<RbNaCl::SecretBoxes::XSalsa20Poly1305:0x007f91224ed710
#      @key="\xE3\xEB\xDDh?\xEC\x06\xF3>\xD3o\x14t\x94\xE3h\xC4\xAD\xCE\xB6PgJ0\x99Q\xAC<\xA1\xA4\x9E\x9D">

nonce = RbNaCl::Random.random_bytes(secret_box.nonce_bytes)
# => "\x13\xCE\xD0\xD0\xB7j2\ac\x1ES\x9E\x97\x84o\x9C\x11/\x1D\xD0\x83\xF1g\x91"

message = 'This is my secret sauce'
# => "This is my secret sauce"

ciphertext = secret_box.encrypt(nonce, message)
# => "n\xA8NX%\xC6tkzf8\b\xC9\xC7}\xCD\x9A\x93n\x92\xF3cGmD\xB8bN \xF0\x8C\xE2D+(\xE9\xEF\xEC\xDB"


## Decryption

# retrieve key and nonce
# key = ...
# nonce = ...

secret_box = RbNaCl::SecretBox.new(key)
# => #<RbNaCl::SecretBoxes::XSalsa20Poly1305:0x007f912227ee20
#      @key="\xE3\xEB\xDDh?\xEC\x06\xF3>\xD3o\x14t\x94\xE3h\xC4\xAD\xCE\xB6PgJ0\x99Q\xAC<\xA1\xA4\x9E\x9D">

decrypted_message = secret_box.decrypt(nonce, ciphertext)
# => "This is my secret sauce"


## Tampering with the ciphertext raises an exception

ciphertext[5] = '?'
# => "?"

ciphertext
# => "n\xA8NX%?tkzf8\b\xC9\xC7}\xCD\x9A\x93n\x92\xF3cGmD\xB8bN \xF0\x8C\xE2D+(\xE9\xEF\xEC\xDB"

decrypted_message = desecret_box.decrypt(nonce, ciphertext)
# RbNaCl::CryptoError: Decryption failed. Ciphertext failed verification.
# from /Users/soumyaray/.rvm/gems/ruby-2.2.0/gems/rbnacl-3.1.2/lib/rbnacl/secret_boxes/xsalsa20poly1305.rb:94:in `open'
