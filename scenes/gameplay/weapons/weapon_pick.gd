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

@export var current_weapon := weapon_types.red:
	set(value):
		current_weapon = value
		update_sprite(value)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var player_weapon = body.change_weapon(current_weapon)
		current_weapon = player_weapon

func update_sprite(weapon_type: weapon_types):
	$Sprite.texture = load(WEAPON_SPRITES[weapon_type])
