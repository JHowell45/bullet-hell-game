extends CharacterBody2D

const DECELERATION = 5

var fixed_rotation = randf_range(-0.1, 0.1)
var speed = 300 * randf_range(0.5, 1.5)

func _ready():
	var player = get_node("/root/Game/Player")
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func _physics_process(delta):
	rotation += fixed_rotation
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	move_and_slide()
	var response_velocity = Vector2.ZERO
	for i in get_slide_collision_count():
		response_velocity += get_slide_collision(i).get_collider().velocity
	#if !response_velocity.is_zero_approx():
		#if velocity.is_zero_approx():
			#velocity = response_velocity
		#else:
			#velocity = response_velocity
			#velocity.x *= -1
			#velocity.y *= -1
	#velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	print(velocity)
	
