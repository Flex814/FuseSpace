extends Area2D

export(int) var SPEED = 30
export(int) var ARMOR = 3
 

# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.y += SPEED * delta

func _on_Squid1_body_entered(body):
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
