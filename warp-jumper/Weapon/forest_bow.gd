# Bow.gd
extends "res://Weapons/BaseWeapon.gd"

func attack() -> void:
	print("Forest Bow: Shooting an arrow! Damage: 10 ", damage , "Speed: 5 ", attack_speed)
	# Additional arrow spawning logic can go here.
