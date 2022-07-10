extends Area2D

const Bullet = preload("res://Scenes/Bullet.tscn")
const ExplosionEffect = preload("res://Scenes/ExplosionEffect.tscn")

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
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()

func fire_bullet():
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position


func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosion = ExplosionEffect.instance()
	main.add_child(explosion)
	explosion.global_position = global_position
