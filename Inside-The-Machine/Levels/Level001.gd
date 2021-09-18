extends Node2D


onready var player = get_node("Player")
onready var Goal = get_node("Goal")


func _ready():
	var size = get_viewport_rect().size
	player.position.x = size.x / 8
	player.position.y = size.y / 2
	Goal.position.x = (size.x / 8) * 7
	Goal.position.y = size.y / 2
	Goal.connect("body_entered", player, "_on_Goal_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
