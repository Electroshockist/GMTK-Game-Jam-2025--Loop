extends Node3D

class_name OutNode
func _ready():
	(owner as Level).out_node = self

## aligns thi in_node of the given level to this out_node
func transform_level(level: Level, in_node: Node3D) -> Level:
	level.global_rotation = global_rotation - level.in_node.global_rotation

	level.position = global_position - level.in_node.global_position

	return level
