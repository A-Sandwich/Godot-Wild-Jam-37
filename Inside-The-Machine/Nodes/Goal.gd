 extends Area2D

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", player, "_on_Goal_body_entered")

func _process(delta):
	if get_tree().get_nodes_in_group("data").size() <= 0:
		$ExitArrow.is_on = true
		$ExitArrow.visible = true
		visible = true
	else:
		$ExitArrow.is_on = false
		$ExitArrow.visible = false
		visible = false
