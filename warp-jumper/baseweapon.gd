# BaseWeapon.gd
extends Node2D

@export var damage: int = 10         # Set damage to 10
@export var attack_speed: float = 5.0  # Set attack speed to 5
@export var range: float = 100.0       # (Optional: adjust if needed)

func attack() -> void:
	# This base function can be overridden by child weapons.
	print("Base Weapon Attack! Damage:", damage, "Speed:", attack_speed)
