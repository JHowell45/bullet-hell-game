extends Node2D

var asteroid_limit = 10
var current_asteroid_count = 0

func spawn_asteroid():
	var asteroid = preload("res://asteroid.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	asteroid.global_position = %PathFollow2D.global_position
	add_child(asteroid)
	


func _on_timer_timeout():
	if current_asteroid_count < asteroid_limit:
		spawn_asteroid()
		current_asteroid_count += 1
