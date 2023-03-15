extends Node2D

#cria uma variável para checar o final da animação
var terminouAnimacao = false
	
#função que inicia quando a animação termina
func _on_chegada_animation_finished(anim_name):
	#torna a variável "terminouAnimação" verdadeira
	terminouAnimacao = true
