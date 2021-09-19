extends Node2D

const DATA = preload("res://Nodes/Data.tscn")
export var pieces_of_data = 5

export var min_distance_from_player = 100
export var max_distance_from_player = 1000
var rng = RandomNumberGenerator.new()
var has_spawned = false

func _process(delta):
	if not has_spawned:
		has_spawned = true
		rng.randomize()
		for i in range(pieces_of_data):
			_spawn_data()

func _spawn_data():
	var datum = DATA.instance()
	datum.position = Vector2(_get_coordinate(), _get_coordinate())
	get_parent().add_child(datum)

func _get_coordinate():
	var coord = rng.randi_range(min_distance_from_player, max_distance_from_player)
	if rng.randi_range(0, 1) == 1:
		coord = coord * -1
	return coord
