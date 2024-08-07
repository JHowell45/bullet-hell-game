extends CharacterBody2D

const SPEED = 300.0

const ROTATE_DEGREES = 0.1

var direction = Vector2(0, 0)

func _physics_process(delta):
	#var direction = Input.get_vector(null, null, "ui_up", "ui_down")
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATE_DEGREES
	if Input.is_action_pressed("ui_right"):
		rotation += ROTATE_DEGREES

	velocity = (direction * SPEED).rotated(rotation)
	
	move_and_slide()
	direction = Vector2(0, 0)
