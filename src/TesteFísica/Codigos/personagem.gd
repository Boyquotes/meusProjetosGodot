extends KinematicBody2D

func _physics_process(delta):
	var movimento = Vector2.ZERO
	
	movimento.y += 10000
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("correndo")
		$AnimatedSprite.flip_h = false
		movimento.x += 20000
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("correndo")
		$AnimatedSprite.flip_h = true
		movimento.x -= 20000
		
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("pulando")
		movimento.y -= 10000
		
	else :
		$AnimatedSprite.play("parado")
	move_and_slide(movimento*delta)
