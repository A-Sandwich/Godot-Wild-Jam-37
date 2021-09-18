extends KinematicBody2D

const SPEED = 550

var velocity = Vector2()
onready var trail = get_node("Trail")
onready var size = get_node("CollisionShape2D").shape.extents

func _ready():
	trail.global_position = global_position

func _physics_process(delta):
	velocity = _determine_velocity(SPEED, velocity)
	move_and_slide(velocity)
	trail.Add_Node(global_position)
	#trail.add_point(position)
	
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
	trail.Create_line(global_position)
