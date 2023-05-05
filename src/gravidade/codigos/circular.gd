extends Sprite


var raio = 200
var velocidade = 3
var angulo = 0

func _process(delta):
	angulo += velocidade * delta
	var x = raio * cos(angulo)
	var y = raio * sin(angulo)
	position = Vector2(x, y)
	
