extends Node2D

@onready var ap :AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func openportal():
	$AnimatedSprite2D.play("PortalOpen")
	ap.play("PortalOpen")
	pass

func portalstay():
	$AnimatedSprite2D.play("PortalStay")
	pass

func closeportal():
	$AnimatedSprite2D.play("PortalClose")
	ap.play("PortalClose")
	pass
