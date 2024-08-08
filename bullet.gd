extends Area2D

const SPEED = 1500
const RANGE = 1500

var travelled_distance = 0

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = Vector2.UP.rotated(rotation)
	position += direction * SPEED * delta
	
	if player.global_position.distance_to(global_position) > RANGE:
		queue_free()
	
	


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
