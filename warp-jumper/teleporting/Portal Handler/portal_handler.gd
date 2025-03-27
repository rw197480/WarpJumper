extends Node2D
#Spawn a portal at origin on 'Q'
#Spawn a new portal at target destination
@export var portal = preload("res://teleporting/portal.tscn")
@export var distance = [200, 400, 600]
@onready var ap :AnimationPlayer = $AnimationPlayer
@export var portal_jump = preload("res://teleporting/Portal Jump/portal_jump.tscn")
@export var wait_time = [3, 4, 5]
@export var portal_beam = preload ("res://teleporting/Portal Beam/portal_beam.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$Marker2D.position.x = distance[Global.level -1]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Global.level +=1
		$Marker2D.position.x = distance[Global.level -1]
	teleport()
	portaljump()
	portalbeam()
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

func portaljump():
	if Input.is_action_just_pressed("Portal Jump"):
		var new_originportal_jump = portal_jump.instantiate()
		new_originportal_jump.global_position = global_position
		get_tree().get_root().add_child(new_originportal_jump)
		
		await get_tree().create_timer(wait_time[Global.level - 1]).timeout
		
		new_originportal_jump.jumpend()
	pass


func portalbeam():
	if Input.is_action_just_pressed("Portal Beam"):
		var new_portal_beam = portal_beam.instantiate()
		new_portal_beam.global_position = $Marker2D.global_position
		get_tree().get_root().add_child(new_portal_beam)
	
	
	pass
