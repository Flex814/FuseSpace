extends Area2D

export(int) var SPEED = 100

#Basic Controls
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
