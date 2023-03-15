extends Control

#cria uma variável que checa se a explicação acabou
var acabou = false
#variável que cria um contador, iniciando no 0
var contador = 0
#variável que armazena as explicações
var dialogos = ["Olá jogador! Você já ouviu falar do Experimento do Gato de Schrödinger? É um experimento mental que foi proposto pelo físico austríaco Erwin Schrödinger em 1935 para ilustrar as ideias da mecânica quântica. Imagine que temos uma caixa selada contendo um gato, um frasco de veneno, um martelo e um contador Geiger. O frasco de veneno é liberado quando o contador Geiger detecta a emissão de uma partícula radioativa. O martelo é acionado quando o frasco de veneno é liberado, e mata o gato.", "De acordo com a mecânica quântica, antes de abrirmos a caixa para ver o que aconteceu, o gato está em um estado de superposição quântica, o que significa que ele está simultaneamente vivo e morto. Isso ocorre porque o resultado da detecção da partícula radioativa é desconhecido até que a caixa seja aberta. Assim, a única maneira de saber se o gato está vivo ou morto é abrir a caixa e observar o resultado. Até que isso seja feito, o gato permanece em um estado de superposição quântica.", "Embora este experimento seja apenas um exercício mental, ele ilustra uma característica fundamental da mecânica quântica: a ideia de que os sistemas quânticos podem estar em estados de superposição e só se tornam bem definidos quando observados."]
	
#função que inicia quando o botão "passar" é pressionado
func _on_passar_pressed():
	#condição que inicia se o contador é menor que o tamanho da lista "diálogos"
	if contador < dialogos.size():
		#muda o texto mostrado no label para o valor "contador" da lista
		$explicacaoTexto.text = dialogos[contador]
	#condição que inicia se o contador é maior ou igual ao tamanho da lista "diálogos"
	if contador >= dialogos.size():
		#torna a variável "acabou" verdadeira
		acabou = true
	#adiciona o valor 1 ao contador
	contador += 1
