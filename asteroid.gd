extends CharacterBody2D

signal destroyed

const DECELERATION = 5

const MAX_DISTANCE = 1000

var fixed_rotation = randf_range(-0.1, 0.1)
var speed = 300 * randf_range(0.5, 1.5)

var player: CharacterBody2D

func _ready():
	player = get_node("/root/Game/Player")
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	

func _physics_process(delta):
	delete_if_too_far()
	rotation += fixed_rotation
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	move_and_slide()
	if get_slide_collision_count() > 0:
		print("%s || COLLISION: %s" % [get_rid(),  get_slide_collision_count()])
		velocity += get_last_slide_collision().get_collider_velocity()
	#for i in get_slide_collision_count():
		#response_velocity += get_slide_collision(i).get_collider().velocity
	#if !response_velocity.is_zero_approx():
		#velocity = response_velocity
	#if !response_velocity.is_zero_approx():
		#if velocity.is_zero_approx():
			#velocity = response_velocity
		#else:
			#velocity = response_velocity
			#velocity.x *= -1
			#velocity.y *= -1
	#velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	print("%s: %s" % [get_rid(), velocity])
	

func delete_if_too_far():
	if global_position.distance_to(player.global_position) > MAX_DISTANCE:
		queue_free()
		destroyed.emit()
