extends Control

#função iniciada junto à incialização do jogo
func _ready():
	#inicia a animação "animacaoDualidade" que muda o título de posição
	$animacaoDualidade.play("animacaoDualidade")
	
#função iniciada quando o botão iniciar é pressionado
func _on_iniciar_pressed():
	#torna a transição visível
	$"transição".visible =true
	#inicia a transição para a próxima cena
	$"transição/chegada".play("chegada")
	
#função que roda a cada quadro do jogo
func _process(delta):
	#condição iniciada quando a animação de transição termina
	if $"transição".terminouAnimacao:
		#cria uma árvore de cenas, puxando a cena "cenaPrincipal"
		get_tree().change_scene("res://Telas/cenaPrincipal.tscn")
