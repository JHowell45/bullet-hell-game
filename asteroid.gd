extends CharacterBody2D

const DECELERATION = 30

func _physics_process(delta):
	var fixed_rotation = randf_range(0.0, 0.2)
	rotation += fixed_rotation
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	move_and_slide()
	for i in get_slide_collision_count():
		print("Sub Velocity: %s" % get_slide_collision(i).get_collider().velocity)
		velocity += get_slide_collision(i).get_collider().velocity
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	print(velocity)
	
