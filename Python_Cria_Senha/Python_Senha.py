import random

lower = "abcdfghijklmnopqrstuvwxyz"
upper = "ABCDFGHIJKLMNOPQRSTUVWXYZ"
numbers = "0123456789"
symbols = "[]{}();*/-_Ç"

all = lower + upper + numbers + symbols

length = 16

password = "".join(random.sample(all, length))

print("=================================")
print(password)
print("=================================")