
password_length = 12      # passwords allowed to be 12 chars long
password_chars = 26       # only lowercase chars allowed

possible_passwords = 26**12             # 12 chars each of 26 possibilities

passwords_entropy = Math.log(26**12, 2) # bits needed for each password chars
