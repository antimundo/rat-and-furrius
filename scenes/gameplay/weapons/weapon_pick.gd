@tool
extends Node2D
class_name WeaponPick
## Weapons placed around the map that player can pick

enum weapon_types { red, green, blue }

const WEAPON_SPRITES = {
	weapon_types.red: "res://assets/sprites/SwordR.png",
	weapon_types.green: "res://assets/sprites/SwordG.png",
	weapon_types.blue: "res://assets/sprites/SwordB.png"
}

const WEAPON_COLORS = {
	weapon_types.red: Color("79304f"),
	weapon_types.green: Color("38907a"),
	weapon_types.blue: Color("3549a8")
}

const WEAPON_PITCH = {
	weapon_types.red: 1.5,
	weapon_types.green: 1.1,
	weapon_types.blue: .8
}

@export var current_weapon := weapon_types.red:
	set(value):
		var particles = pick_particles.instantiate()
		add_child(particles)
		particles.color = Color(WEAPON_COLORS[current_weapon])
		particles.emitting = true
		$AudioStreamPlayer.pitch_scale = WEAPON_PITCH[current_weapon]
		current_weapon = value
		update_sprite(value)
		$AnimationPlayer.play("pickup")
		$AnimationPlayer.seek(0)
		$AudioStreamPlayer.play()

var pick_particles = preload("res://scenes/gameplay/weapons/weapon_pick_particle.tscn")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var player_weapon = body.change_weapon(current_weapon)
		current_weapon = player_weapon

func update_sprite(weapon_type: weapon_types):
	$Sprite.texture = load(WEAPON_SPRITES[weapon_type])
