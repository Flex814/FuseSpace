extends Area2D

const Death = preload("res://Scenes/Death.tscn")

export(int) var SPEED = 45
export(int) var ARMOR = 1

signal score_up

# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.y += SPEED * delta

func _on_Glyph_body_entered(body):
	body.create_hit_effect()
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		add_to_score()
		create_explosion()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func add_to_score():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.score += 15

func create_explosion():
	var main = get_tree().current_scene
	var death = Death.instance()
	main.add_child(death)
	death.global_position = global_position
