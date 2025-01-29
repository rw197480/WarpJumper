extends Node2D
#Spawn a portal at origin on 'Q'
#Spawn a new portal at target destination
@export var portal = preload("res://teleporting/portal.tscn")
@export var distance = [200, 400, 600]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$Marker2D.position.x = distance[Global.level -1]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	teleport()
	pass


func teleport():
	if Input.is_action_just_pressed("Teleport"):
		#Origin Portal
		var new_originportal = portal.instantiate()
		new_originportal.global_position = global_position
		get_tree().get_root().add_child(new_originportal)
		await get_tree().create_timer(1).timeout
		#Destination Portal
		var new_portal = portal.instantiate()
		new_portal.global_position = $Marker2D.global_position
		get_tree().get_root().add_child(new_portal)
		
		pass
