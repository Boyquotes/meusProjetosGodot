extends Node2D

var pedra = preload("res://sprites/pedra.png")
var papel = preload("res://sprites/papel.png")
var tesoura = preload("res://sprites/tesoura.png")
var listaimg = [pedra, papel, tesoura]
var jogadacomp
var estado
var pontojogador = 0
var pontocomp = 0 

func _ready():
	randomize()
	$Label3.visible = false
	
func verificarPontos(a):
	if a == "empatou":
		$Label3.text = "Empatou"
		$Label3.visible = true
	elif a == "perdeu":
		pontocomp += 1
		$placarComputador.text = String(pontocomp)
		$Label3.text = "Perdeu"
		$Label3.visible = true
	elif a == "ganhou":
		pontojogador += 1
		$placarJogador.text = String(pontojogador)
		$Label3.text = "Ganhou"
		$Label3.visible = true
		
func _on_Pedra_pressed():
	$SpriteComputador.visible = false
	gerarcomp()
	$SpriteJogador.texture = pedra
	$SpriteJogador.visible = true
	$SpriteComputador.visible = true
	if jogadacomp == pedra:
		estado = "empatou"
		verificarPontos(estado)
	elif jogadacomp ==  papel:
		estado = "perdeu"
		verificarPontos(estado)
	elif jogadacomp == tesoura:
		estado = "ganhou"
		verificarPontos(estado)

func _on_Tesoura_pressed():
	$SpriteComputador.visible = false
	gerarcomp()
	$SpriteJogador.texture = tesoura
	$SpriteJogador.visible = true
	$SpriteComputador.visible = true
	if jogadacomp == pedra:
		estado = "perdeu"
		verificarPontos(estado)
	elif jogadacomp ==  papel:
		estado = "ganhou"
		verificarPontos(estado)
	elif jogadacomp == tesoura:
		estado = "empatou"
		verificarPontos(estado)

func _on_Papel_pressed():
	$SpriteComputador.visible = false
	gerarcomp()
	$SpriteJogador.texture = papel
	$SpriteJogador.visible = true
	$SpriteComputador.visible = true
	if jogadacomp == pedra:
		estado = "ganhou"
		verificarPontos(estado)
	elif jogadacomp ==  papel:
		estado = "empatou"
		verificarPontos(estado)
	elif jogadacomp == tesoura:
		estado = "perdeu"
		verificarPontos(estado)

func gerarcomp():
	randomize()
	jogadacomp = listaimg[randi() % listaimg.size()]
	$SpriteComputador.visible = true
	$SpriteComputador.texture = jogadacomp
