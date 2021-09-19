extends MarginContainer


func _ready():
	pass


func _on_Button_pressed():
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()

