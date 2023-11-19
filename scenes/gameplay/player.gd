extends CharacterBody2D

@export var speed = 40
var is_snapped := false
var last_position

func get_input():
	look_at(get_global_mouse_position())
	
	const SNAP_PADDING := 10
	const UNSNAP_DISTANCE := 250
	
	var distance = position.distance_to(get_global_mouse_position())
	
	if is_snapped:
		$Area.visible = false
		if distance < UNSNAP_DISTANCE and distance > SNAP_PADDING:
			velocity = transform.x * speed * (distance - SNAP_PADDING)
			$Sprite2D.scale.x = 0.5 - (position.distance_to(last_position) / 200)
			$Weapon/Sprite.rotation = -10 - (position.distance_to(last_position) / 100)
			$Weapon/Sprite.scale.x = 1 - (position.distance_to(last_position) / 200)
		elif distance > UNSNAP_DISTANCE:
			is_snapped = false
	else:
		$Area.visible = true
		$Sprite2D.scale.x = 0.5
		$Weapon/Sprite.scale.x = 1
		velocity = transform.x * 0
		if distance < UNSNAP_DISTANCE / 4:
			is_snapped = true
	last_position = position

func _physics_process(delta):
	get_input()
	move_and_slide()

func change_weapon(new_weapon):
	var old_weapon = $Weapon.current_weapon
	$Weapon.current_weapon = new_weapon
	$Tail/Line2D.change_gradient(new_weapon)
	$Weapon/AnimationPlayer.play("pickup")
	return old_weapon
