extends Node2D

@onready var ap :AnimationPlayer = $AnimationPlayer
@export var wait_time = [10, 20, 25]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func jumpintro():
	ap.play("PortalJumpIntro")
	
	pass

func jumpend():
	ap.play("PortalJumpEnd")
	
	pass
