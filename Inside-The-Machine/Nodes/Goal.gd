extends Area2D

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player.position)
	connect("body_entered", player, "_on_Goal_body_entered")



func _on_Goal_body_entered(body):
	print("help")
