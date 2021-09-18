extends Node2D

const BasicEnemy = preload("res://Enemies/BasicEnemy.tscn")
export var enemies_per_spawn = 5
export var max_enemies = 50
export var min_distance_from_player = 150
export var max_distance_from_player = 1000
var rng = RandomNumberGenerator.new()
onready var player = get_parent().get_node("Player")

func _ready():
	rng.randomize()

func _spawn_enemy():
	var enemy = BasicEnemy.instance()
	_set_speed(enemy)
	enemy.position = Vector2(_get_coordinate(), _get_coordinate())
	get_parent().add_child(enemy)

func _get_coordinate():
	var coord = rng.randi_range(min_distance_from_player, max_distance_from_player)
	if rng.randi_range(0, 1) == 1:
		coord = coord * -1
	return coord

func _set_speed(enemy):
	enemy.SPEED = enemy.SPEED * rng.randf()

func _on_Timer_timeout():
	for iteration in range(enemies_per_spawn):
		if get_tree().get_nodes_in_group("enemy").size() > max_enemies:
			return
		_spawn_enemy()
