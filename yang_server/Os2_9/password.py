import random
length = int(input('pass length : '))
chars = 'abcdefghijklmnopqrlstuvwxyzABCDEFGHIJKLMNOPQRLSTUVWXYZ0123456789@*?!$#%&-~'
for i in range(10):
    password = ''
    for l in range(length):
        password += random.choice(chars)
    print(password)

