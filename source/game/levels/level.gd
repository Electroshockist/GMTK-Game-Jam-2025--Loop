extends Node3D
class_name Level

var in_node: Node3D
var out_node: OutNode

func _ready():
	_set_nodes()

func _set_nodes():
	var children := get_children(true)

	if !children.is_empty():
		for child in children:
			if (child.is_in_group("InNode")):
				in_node = child
			if (in_node != null):
				return

func transform_level(level: Level) -> Level:
	return out_node.transform_level(level, in_node)

func on_door_anim_finish():
	GameManager.game.on_enter_next_level()
