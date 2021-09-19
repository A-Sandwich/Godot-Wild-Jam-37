extends Area2D

onready var player = get_tree().get_nodes_in_group("player")[0]


func _on_Data_body_entered(body):
	print("name", body.name.to_lower())
	if "player" in body.name.to_lower():
		player.obtain_data()
		queue_free()
