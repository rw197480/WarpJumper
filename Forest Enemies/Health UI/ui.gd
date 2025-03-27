extends CanvasLayer

@onready var score: Label = $Score

@onready var health_bar: TextureProgressBar = $"Health Bar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = "Score ::" + str(Global.score)
	if Global.player_active:
		health_bar.value = lerp(float(health_bar.value), float(Global.player.health), 0.125)
	else:
		health_bar.value = lerp(float(health_bar.value), 0.0, 0.05)
	
	pass


func _on_restart_pressed() -> void:
	
	get_tree().reload_current_scene()
	
	pass # Replace with function body.
