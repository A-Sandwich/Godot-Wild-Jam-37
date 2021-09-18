extends Line2D

const NODE = preload("res://Nodes/Node.tscn")

var all_nodes = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	default_color = Color(1.0, 0, 0, 1.0)


func Add_Node(current_position):
	if all_nodes.size() == 0 or all_nodes[-1].get_global_position().distance_to(current_position) > 50:
		var node = NODE.instance()
		# this is ugly and needs to be cleaned up
		if all_nodes.size() > 0:
			node.position.x = (current_position.x + all_nodes[-1].get_global_position().x) / 2
			node.position.y = (current_position.y + all_nodes[-1].get_global_position().y) / 2
		else:
			node.position = current_position
		get_tree().get_root().add_child(node)
		all_nodes.append(node)
		
		add_point(get_parent().position)


func Create_line(global_position):
	pass
		
