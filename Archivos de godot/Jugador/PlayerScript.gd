extends KinematicBody2D

const ARRIBA = Vector2(0, -1)
var movimiento = Vector2()
var vidas = 3
signal golpe

func _physics_process(delta):
	movimiento.y += 10
	$AnimatedSprite.play("correr")
	if Input.is_action_pressed("ui_right"):
		movimiento.x = 250
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		
		movimiento.x = -250
		$AnimatedSprite.flip_h = true
	else:
		movimiento.x = 0
		$AnimatedSprite.play("correr")
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimiento.y = -500
	else: 
		$AnimatedSprite.play("correr")
	movimiento = move_and_slide(movimiento, ARRIBA)
	

func _on_GolpeDetector_body_entered(body):
	queue_free()
	get_tree().change_scene("res://Menu.tscn")

func _on_GolpeDetector_area_entered(area):
	queue_free()
	get_tree().change_scene("res://Menu.tscn")
