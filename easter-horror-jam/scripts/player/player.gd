extends CharacterBody2D

@export var speed: float = 150.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flashlight: Node2D = $Flashlight

var last_direction: Vector2 = Vector2.DOWN

func _physics_process(_delta: float) -> void:
	# Get input 
	var input_direction := Vector2.ZERO
	input_direction.x = Input.get_axis("ui_left", "ui_right")
	input_direction.y = Input.get_axis("ui_up", "ui_down")
	
	# If moving, update direction and velocity
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()
		last_direction = input_direction
		velocity = input_direction * speed
		animated_sprite_2d.play("walk")
	else:
		# Stop moving and play idle animation
		velocity = Vector2.ZERO
		animated_sprite_2d.play("idle")
	
	# Flip sprite based on x direction
	if last_direction.x < 0:
		animated_sprite_2d.flip_h = true
	elif last_direction.x > 0:
		animated_sprite_2d.flip_h = false
	
	move_and_slide()

# Get the direction the player is facing
func get_facing_direction() -> Vector2:
	return last_direction
