extends Node2D

func spawn_asteroid():
	var asteroid = preload("res://asteroid.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	asteroid.global_position = %PathFollow2D.global_position
	add_child(asteroid)
	


func _on_timer_timeout():
	spawn_asteroid()
