extends Area2D
## Used in levels to signal a player reached the end
## Also used in cheese to signal the player got the cheese

signal player_entered_enemy_weak_spot

var weak_to_weapon_type: WeaponPick.weapon_types:
	set(value):
		if value == Cat.Weakness.red:
			weak_to_weapon_type = WeaponPick.weapon_types.red
		elif value == Cat.Weakness.green:
			weak_to_weapon_type = WeaponPick.weapon_types.green
		elif value == Cat.Weakness.blue:
			weak_to_weapon_type = WeaponPick.weapon_types.blue

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_current_weapon"):
			if body.get_current_weapon() == weak_to_weapon_type:
				player_entered_enemy_weak_spot.emit()
