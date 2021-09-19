extends Node2D

onready var pointer = $Pointer
onready var icon = $Pointer/Icon
onready var distance = $Pointer/Icon/distance
onready var player = get_tree().get_nodes_in_group("player")[0]
var is_on = false

func _ready():
	pass

func _process(delta):
	if not is_on:
		return
	var canvas = get_canvas_transform()
	var top_left = -canvas.origin / canvas.get_scale()
	var size = get_viewport_rect().size / canvas.get_scale()
	
	set_marker_position(Rect2(top_left, size))
	set_marker_rotation()
	set_distance()

func set_marker_position(bounds : Rect2):
	pointer.global_position.x = clamp(global_position.x, bounds.position.x + 25, bounds.end.x - 25)
	pointer.global_position.y = clamp(global_position.y, bounds.position.y + 25, bounds.end.y - 25)
	
	if bounds.has_point(global_position):
		hide()
	else:
		show()

func set_marker_rotation():
	var angle = (global_position - pointer.global_position).angle()
	pointer.global_rotation = angle
	icon.global_rotation = 0

func set_distance():
	distance.text = "0"
	var reading = get_parent().get_global_position().distance_to(player.get_global_position())
	distance.text = reading as String
