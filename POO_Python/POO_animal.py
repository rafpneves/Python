import subprocess
from subprocess import PIPE

# Limpa o terminal [ Somente no Linux ]
def clear(): 
    # Clear
    subprocess.run(["clear"])


# Objeto
class Animal:
    # Atributos [Contrutor]
    def __init__(self, nome: str, idade: int, peso: float, raca: str):
        self.nome = nome
        self.idade = idade
        self.peso = peso
        self.raca = raca

    # Metodos
    def produzirSom(self):
        print(f"O animal de nome {self.nome} e raça {self.raca} está produzindo som.")
    
    # Metodos
    def locomover(self):
        print(f"O animal de nome {self.nome} esta de locomovendo com idade de {self.idade} anso")

    # Metodos
    def alimentar(self):
        print(f"O animal de nome {self.nome} esta se alimentando e com peso de {self.peso}Kg")

animal1 = Animal(nome="Sadam", idade=15, peso=20, raca="Doberman")

if __name__ == "__main__":
    clear() 
    animal1.produzirSom()
    print("\n")