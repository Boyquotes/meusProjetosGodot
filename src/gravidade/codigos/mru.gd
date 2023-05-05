extends Node2D

var deslocamento 
var velocidade 
var tempo 

var d 
var v 
var t

func _on_calcular_pressed():
	deslocamento = $controles/fundocontroles/resposta1.text
	velocidade = $controles/fundocontroles/resposta2.text
	tempo = $controles/fundocontroles/resposta3.text
	
	if deslocamento == "":
		v = int($controles/fundocontroles/resposta2.text)
		t = int($controles/fundocontroles/resposta3.text)
		d = v * t
		print(d)
	elif velocidade == "":
		d = int($controles/fundocontroles/resposta1.text)
		t = int($controles/fundocontroles/resposta3.text)
		v = d / t
		print(v)
	elif tempo == "":
		v = int($controles/fundocontroles/resposta2.text)
		d = int($controles/fundocontroles/resposta1.text)
		t = d / v
		print(t)
	else: print("erro")
