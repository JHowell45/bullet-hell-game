extends CharacterBody2D

const SPEED = 500.0
const ROTATE_DEGREES = 0.1
const DECELERATION = 150

var direction = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
		velocity = (direction * SPEED).rotated(rotation)
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATE_DEGREES
	if Input.is_action_pressed("ui_right"):
		rotation += ROTATE_DEGREES
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	move_and_slide()
	print("SHIP: %s" % velocity)

func shoot():
	if Input.is_action_just_pressed("ui_select"):
		var bullet = preload("res://bullet.tscn").instantiate()
		bullet.global_position
		add_child(bullet)
