extends CharacterBody2D


@export var movement_speed: float = 70.0
@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")
var grunt = preload("res://Forest Enemies/grunt.tscn")
var health := 1

func _ready() -> void:
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	var seed = randi_range(0, 2)
	
	health = [1,3,7][seed]
	
	var ran_scale = [1,2,3][seed] 
	
	$AnimatedSprite2D.scale *= ran_scale
	$CollisionShape2D.scale *= ran_scale
	$Hitbox/CollisionShape2D.scale *= ran_scale
	
	
	var ran_spin = ["rotate left", "rotate right"][randi_range(0,1)]
	
	
	
	if Global.player:
		var impulse_vec = Global.player.global_position - global_position
		impulse_vec = impulse_vec.normalized()
		impulse_vec *= randf_range(100, 300)
	
	
	pass


func spawn():
	var rand_rot = randf_range(0,360)
	rotation_degrees = rand_rot
	
	var new_grunt = grunt.instantiate()
	new_grunt.global_position = $Marker2D.global_position
	
	get_tree().get_root().add_child(new_grunt)


func set_movement_target(movement_target: Vector2):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	set_movement_target(Global.player.global_position)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = lerp(velocity.x,0.0,0.125)
		print("test")
		move_and_slide()
		return
	# Do not query when the map has never synchronized and is empty.
	if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
		return
	if navigation_agent.is_navigation_finished():
		return
	if global_position.y > Global.player.global_position.y: 
		return 
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()
	
func _on_hitbox_area_entered(area: CharacterBody2D) -> void:
	
	if area.is_in_group("Kirk"):
		health -= 1
		area.queue_free()
		 
	
	pass # Replace with function body.


func _on_hitbox_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		body.hit(global_position)
	
	
	
	pass
