extends Control

var lista = []
var x = 1


func _ready():
	piramide(11)
	
func piramide(n):
	for valor in range(1, (n+1)/2+1):
		for numero in range(x, n+1):
			lista.append(numero)
		print(lista, "\n")
		lista = []
		n -= 1
		x += 1
