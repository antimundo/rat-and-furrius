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

@export var current_weapon := weapon_types.red:
	set(value):
		$CPUParticles2D.color = Color(WEAPON_COLORS[current_weapon])
		current_weapon = value
		update_sprite(value)
		$AnimationPlayer.play("pickup")
		$CPUParticles2D.emitting = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var player_weapon = body.change_weapon(current_weapon)
		current_weapon = player_weapon

func update_sprite(weapon_type: weapon_types):
	$Sprite.texture = load(WEAPON_SPRITES[weapon_type])
