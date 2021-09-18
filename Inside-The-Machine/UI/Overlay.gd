extends MarginContainer

onready var button = $CenterContainer/Button

func _ready():
	var size = get_viewport_rect().size
	set_size(Vector2(300, 200))
	set_global_position(Vector2(-1 * (get_rect().size.x/4), size.y / 8))



func _on_Button_pressed():
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()
	
