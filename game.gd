extends Node2D

var asteroid_limit = 10
var current_asteroid_count = 0

const ASTEROID_POINTS = 1

var score = 0

func _ready():
	set_score()

func spawn_asteroid():
	var asteroid = preload("res://asteroid.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	asteroid.global_position = %PathFollow2D.global_position
	asteroid.disappeared.connect(_on_asteroid_disappeared)
	asteroid.destroyed.connect(_on_asteroid_destroyed)
	add_child(asteroid)
	


func _on_timer_timeout():
	#print("ASTEROID COUNT: %s" % current_asteroid_count)
	if current_asteroid_count < asteroid_limit:
		spawn_asteroid()
		current_asteroid_count += 1

func _on_asteroid_disappeared():
	current_asteroid_count -= 1

func _on_asteroid_destroyed():
	current_asteroid_count -= 1
	score += ASTEROID_POINTS
	set_score()

func set_score():
	%Score.text = "Score: %s" % score
