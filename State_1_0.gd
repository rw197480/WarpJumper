extends Node2D

class_name State_1_0

@export var can_move : bool = true

@onready var debug = owner.find_child("debug")
@onready var player = owner.get_parent().find_child("player")

func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)

func transition():
	pass
	
func _physics_process(_delta):
	transition()
	debug.text = name
