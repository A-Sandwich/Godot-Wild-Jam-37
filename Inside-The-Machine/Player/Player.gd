extends KinematicBody2D

const SPEED = 550

var velocity = Vector2()
onready var trail = get_node("Trail")
onready var size = get_node("CollisionShape2D").shape.extents

func _ready():
	# sometimes when I load a new scene the game doesn't unpause even though I unpause it...
	get_tree().paused = false
	trail.global_position = global_position

func _physics_process(delta):
	velocity = _determine_velocity(SPEED, velocity)
	move_and_slide(velocity)
	trail.Add_Node(global_position)
	_we_bumpin()

func _we_bumpin():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if "enemy" in collision.collider.name.to_lower() :
			$UI.visible = true
			get_tree().paused = true


func _determine_velocity(speed, velocity):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  speed
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y =  speed
	else:
		velocity.y = 0
	return velocity


func _on_Goal_body_shape_entered(body_id, body, body_shape, local_shape):
	print("Player in goal")
	trail.Create_line(global_position)
