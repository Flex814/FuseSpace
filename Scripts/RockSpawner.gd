extends Node2D

const Rock = preload("res://Scenes/Rock.tscn")

onready var spawnPoints = $SpawnPoints

func get_spawn_position():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_enemy():
	var spawn_position = get_spawn_position()
	var rock = Rock.instance()
	var main = get_tree().current_scene
	main.add_child(rock)
	rock.global_position = spawn_position
	
func _on_Timer_timeout():
	spawn_enemy()
