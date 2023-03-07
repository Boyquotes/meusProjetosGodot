extends Node2D
var velocidadeFoguete = 0
var velocidadeFoguete2 = 0

func _ready():
	pass
	
func _process(delta):
	$Foguete.move_local_x(velocidadeFoguete)
	#verficar a colisão controlando a diferença entre as posições dos objetos
	if abs($Foguete.position.x - $Parede.position.x) < 70:
		velocidadeFoguete = 0
		$Label.text = "SHAZAN"
	$Foguete2.move_and_slide(velocidadeFoguete2*Vector2(100,0))
	
func _on_Button_pressed():
	velocidadeFoguete  = 10
	velocidadeFoguete2 = 5


func _on_Parede2_body_entered(body):
	velocidadeFoguete2 = 0 
	$Label2.text = "HÁIEIÉ"
