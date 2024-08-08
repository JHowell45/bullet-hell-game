extends Node2D

var asteroid_limit = 2
var current_asteroid_count = 0

func spawn_asteroid():
	var asteroid = preload("res://asteroid.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	asteroid.global_position = %PathFollow2D.global_position
	asteroid.destroyed.connect(_on_asteroid_destroyed)
	add_child(asteroid)
	


func _on_timer_timeout():
	#print("ASTEROID COUNT: %s" % current_asteroid_count)
	if current_asteroid_count < asteroid_limit:
		spawn_asteroid()
		current_asteroid_count += 1


func _on_asteroid_destroyed():
	current_asteroid_count -= 1
