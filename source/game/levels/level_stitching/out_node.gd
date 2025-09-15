extends Node3D

class_name OutNode
func _ready():
	(owner as Level).out_node = self

## aligns thi in_node of the given level to this out_node
func transform_level(in_level: Level):
	# Get global transforms of the two points
	var out_global: Transform3D = global_transform
	var in_global: Transform3D = in_level.in_node.global_transform

	# Compute parent2’s transform so that in_node aligns with out_node
	# First, get parent2’s transform relative to its child "in"
	var parent2_from_in: Transform3D = in_level.global_transform * in_global.affine_inverse()

	# Now position parent2 so that "in" aligns with "out"
	in_level.global_transform = out_global * parent2_from_in

func debug(level: Level):
	print("Out Level: %s 
		\tout node pos: %s
		\tout node rot: %s\r
		In Level: %s
		\tin node pos: %s
		\tin node rot: %s\r
		New transform: %s
		\t"
		 % [owner.name, global_position, global_rotation, level.name, level.in_node.position, level.in_node.rotation])

func _get_new_pos(in_level: Level) -> Vector3:
	return global_position - in_level.in_node.global_position
