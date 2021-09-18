extends KinematicBody2D

var SPEED = 200
onready var Player = get_parent().get_node("Player")

func _ready():
	pass

func _physics_process(delta):
	if Player == null:
		print("is null")
		# try and get the player
		Player = get_parent().get_node("Player")
		return
	var direction = (Player.position - position).normalized()
	var motion = direction * SPEED
	move_and_slide(motion)
