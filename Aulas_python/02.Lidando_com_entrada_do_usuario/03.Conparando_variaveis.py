print("")
print("")
print("")

numero_secreto = 42

chute_str = input("Digite o seu nomero: ")

print("Você digitou ", chute_str )

chute = int(chute_str) # Tranformando uma string em inteiro

if(numero_secreto == chute):
    print("Você acertou!")
else:
    print("Você errou!")