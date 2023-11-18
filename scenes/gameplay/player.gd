extends CharacterBody2D

@export var speed = 400

func get_input():
	look_at(get_global_mouse_position())
	if Input.is_mouse_button_pressed(1):
		velocity = transform.x * speed
	else:
		velocity = transform.x * 0

func _physics_process(delta):
	get_input()
	move_and_slide()
