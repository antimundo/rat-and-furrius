extends CharacterBody2D

@export var speed = 40
var is_snapped := false

func get_input():
	look_at(get_global_mouse_position())
	
	const SNAP_PADDING := 10
	const UNSNAP_DISTANCE := 250
	
	var distance = position.distance_to(get_global_mouse_position())
	
	if is_snapped:
		$Area.visible = false
		if distance < UNSNAP_DISTANCE and distance > SNAP_PADDING:
			velocity = transform.x * speed * (distance - SNAP_PADDING)
		elif distance > UNSNAP_DISTANCE:
			is_snapped = false
	else:
		$Area.visible = true
		velocity = transform.x * 0
		if distance < UNSNAP_DISTANCE / 4:
			is_snapped = true

func _physics_process(delta):
	get_input()
	move_and_slide()
