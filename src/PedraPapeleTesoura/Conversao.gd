extends Node2D

var simulacao 
var num1 

func toBin(n):
		
	var bin = ""
	for x in range(7, -1, -1):
		#print( pow(2, x) , "\n")
		if(n >= pow(2, x)):
			bin += '1'
			n -= pow(2, x)
		else:
			bin += '0'
	return bin
			
func _ready():
	simulacao = false
		
func _process(delta):
	if simulacao:
		#aqui vai o código do programa
		var num1 = int($num1.text)
		print(toBin(num1))
		if num1 > 0 && num1 < 256:
			$Saida.text = "O NÚMERO " + String(num1) + " É IGUAL À " + String(toBin(num1)) 
			simulacao = false
		else:
			$Saida.text = "INSIRA VALORES VÁLIDOS!"
			simulacao = false



func _on_Iniciar_pressed():
	simulacao = true
