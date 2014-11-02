
def test_smear(plaintext, numtests)
    ctexts = {}

    (1..numtests).each  do |k| 
        ciphertext = plaintext.smear(k)
        ctexts[ciphertext].nil? ? ctexts[ciphertext] = 1 : ctexts[ciphertext] += 1
    end

    collisions = ctexts.select {|k,v| ctexts[k] > 1}.length
    puts "#{collisions} collisions out of #{ctexts.length} combinations"
end