extends Node2D

#cria uma variável que verifica o início do jogo
var iniciou = false

#função ativada quando o botão start é pressionado
func _on_buttonstart_pressed():
	#transforma a variável inicou em verdadeira
	iniciou =  true
	
#função que roda junto aos frames do jogo
func _process(delta):
	#verifica se a variável inicou é verdadeira
	if iniciou:
		#verifica se a posição da tartaruga é menor ou igual a 943
		if $turtlecode.position.x <= 943:
			#adiciona o valor 10 à posição da tartaruga
			$turtlecode.position.x += 10
		#verifica se a posição da tartaruga é maior ou igual a 943
		if $turtlecode.position.x >= 943:
			#inicia a animação de explosão
			$turtlecode.play("explosion")
		#verifica se a posição do corpo é menor ou igual a 943
		if $KinematicBody2D.position.x <= 943:
			#adiciona o valor 10 à posição do corpo
			$KinematicBody2D.position.x += 10
			
#função iniciada quando um corpo entra na área 2d
func _on_Area2D_body_entered(body):
	#inicia a animação de explosão do corpo
	$KinematicBody2D/turtlevector.play("explosion")

