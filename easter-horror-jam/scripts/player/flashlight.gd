extends Node2D

func _process(_delta: float) -> void:
	# Rotate flashlight to face mouse
	look_at(get_global_mouse_position())
