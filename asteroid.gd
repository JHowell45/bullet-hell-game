extends Area2D

func _physics_process(delta):
	pass


func _on_body_entered(body):
	var velocity = body.velocity
	global_position += velocity
