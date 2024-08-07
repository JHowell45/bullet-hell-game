extends CharacterBody2D

const SPEED = 500.0
const ROTATE_DEGREES = 0.1
const DECELERATION = 150

var direction = Vector2.ZERO

func _physics_process(delta):
	#var direction = Input.get_vector(null, null, "ui_up", "ui_down")
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
		velocity = (direction * SPEED).rotated(rotation)
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATE_DEGREES
		#velocity = (direction * SPEED).rotated(rotation)
	if Input.is_action_pressed("ui_right"):
		rotation += ROTATE_DEGREES
		#velocity = (direction * SPEED).rotated(rotation)
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	print(velocity)
	move_and_slide()
	
	#direction = Vector2.ZERO
