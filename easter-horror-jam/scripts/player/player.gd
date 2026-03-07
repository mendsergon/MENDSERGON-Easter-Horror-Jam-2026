extends CharacterBody2D

@export var speed: float = 300.0
@export var acceleration: float = 1500.0
@export var friction: float = 1200.0

var last_direction: Vector2 = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var input_direction := Vector2.ZERO
	input_direction.x = Input.get_axis("ui_left", "ui_right")
	input_direction.y = Input.get_axis("ui_up", "ui_down")
	
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()
		last_direction = input_direction
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()

func get_facing_direction() -> Vector2:
	return last_direction
