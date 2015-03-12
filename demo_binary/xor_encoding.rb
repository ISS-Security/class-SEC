## ENCODING WITH XOR

# byte encoding
original = 0b01100110
xor_key  = 0b10101010
output   = original ^ xor_key
output.to_s(2)
# => "11001100"
(output ^ xor_key).to_s(2)
# => "1100110"

# string encoding
secret = 'Project Ultra'
key  = 'k'

secret.chars.map {|c| c.ord ^ key.ord }
# => [59, 25, 4, 1, 14, 8, 31, 75, 62, 7, 31, 25, 10]

encrypt = secret.chars.map {|c| (c.ord ^ key.ord).chr }.join
# => ";\x19\x04\x01\x0E\b\x1FK>\a\x1F\x19\n"
decrypt = encrypt.chars.map {|e| (e.ord ^ key.ord).chr }.join
# => "Project Ultra"
