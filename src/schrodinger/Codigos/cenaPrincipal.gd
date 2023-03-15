extends Node2D

#cria uma varíavel chamada "vivo" que começa verdadeira
var vivo = true
#cria uma varíavel
var futuroVivo
#cria uma varíavel que armazenará o valor que o gato terá quando a radiação entrar
var entrou = false
#cria uma varíavel que verifica se está rodando 
var jogando = false
#cria uma varíavel para trocar a sprite, começando como falso
var trocarSprite = false
#cria uma varíavel que armazena a textura do gato morto
var gatoMorto = preload("res://Imagens/gatoSpriteDeath.png")
#cria uma varíavel "status" para o estado do gato
var status = 0
#cria uma varíavel chamada quadro, para instanciar a explicação futuramente
var quadro = false
#cria uma varíavel "temporizador" que criará um contador interno
var temporizador = 0
	
#função que inicia ao abrir a cena
func _ready():
	#torna a label que retorna se o gato está vivo como invisível
	$estadoGato.visible = false
	#randoniza a seed da cena
	randomize()
	# torna a variável jogando verdadeira
	jogando = true
	#dá o valor 0 ou 1 para a variável futuroVivo
	futuroVivo = int(rand_range(0, 2))
	
#função que roda a cada frame do jogo
func _process(delta):
	#função que roda se a variável quadro é verdadeira
	if quadro:
		#adiciona o valor 1 ao temporizador
		temporizador += 1
		#condição que inicia se o temporizador passa o valor 180 (3 segundos)
		if temporizador >= 180:
			#torna a cena "explicacao" visível
			$explicacao.visible = true
			#torna o fundo translúcido visível
			$trans.visible = true
			
	# condição que inicia se a cena "explicacao" termina
	if $explicacao.acabou:
		#torna a cena "explicacao" invisível
		$explicacao.visible = false
		#torna o fundo translúcido invisível
		$trans.visible = false
		
#função que inicia se o botão "colocar" é pressionado
func _on_colocar_pressed():
	#condição que inicia se a variável "status" receber 0
	if status == 0:
		#condição que inicia se a variável "entrou" é falsa
		if entrou == false:
			#inicia a animação "caixaEntra"
			$caixaAnimacao.play("caixaEntra")
			
#função que inicia quando alguma animação termina
func _on_caixaAnimacao_animation_finished(anim_name):
	#verifica se a animção que terminou tem o nome "caixaSai" e inicia
	if anim_name == "caixaSai":
		#trona a variável "entrou" falsa
		entrou = false
		#torna a variável "status" como 1
		status = 1
		#torna a label "estadoGato" visível, mostrando seu estado
		$estadoGato.visible = true
		#torna a variável quadro como verdadeira
		quadro = true
	#verifica se a animção que terminou tem o nome "caixaEntra" e inicia
	elif anim_name == "caixaEntra":
		#condição que inicia se a variável "futuroVivo" recebe 0
		if futuroVivo == 0:
			#muda a textura do gato para "gatoMorto"
			$gato.texture = gatoMorto
			#torna a label do estado do gato como "O gato morreu!"
			$estadoGato.text = "O gato morreu!"
		#condição que inicia se a variável "futuroVivo" recebe 1
		elif futuroVivo == 1:
			#torna a label do estado do gato como "O gato viveu!" 
			$estadoGato.text = "O gato viveu!"
		#inicia a animação "uranio"
		$caixaAnimacao.play("uranio")
	#verifica se a animção que terminou tem o nome "uranio" e inicia
	if anim_name == "uranio":
		#torna a variável "entrou" como verdadeira
		entrou = true
		
#função que inicia se o botão "colocar" é pressionado
func _on_tirar_pressed():
	#condição que inicia se a variável "status" recebe 0
	if status == 0:
		#condiçãoq ue inicia se a variável "entrou" é verdadeira
		if entrou:
			#inicia  a animação "caixaSai"
			$caixaAnimacao.play("caixaSai")
		
#função que inicia se o botão "colocar" é pressionado
func _on_reiniciar_pressed():
	#condição que inicia se o status recebe 1
	if status == 1:
		#randoniza a seed da cena
		randomize()
		#muda a cena para a própria cena, reiniciando-a
		get_tree().change_scene("res://Telas/cenaPrincipal.tscn")
