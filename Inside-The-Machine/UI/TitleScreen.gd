extends CanvasLayer


func _ready():
	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Story/Story.tscn")
