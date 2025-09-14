extends Node3D

class_name OutNode
func _ready():
	(owner as Level).out_node = self

## aligns thi in_node of the given level to this out_node
func transform_level(level: Level, in_node: Node3D) -> Level:
	# rotation
	var rot := global_rotation - in_node.global_rotation


	# distance between points
	var dist := global_position

	# # Get global transforms of the two points
	# var out_global: Transform3D = global_transform
	# var in_global: Transform3D = in_node.global_transform

	# # Compute parent2’s transform so that in_node aligns with out_node
	# # First, get parent2’s transform relative to its child "in"
	# var parent2_from_in: Transform3D = level.global_transform * in_global.affine_inverse()

	# # Now position parent2 so that "in" aligns with "out"
	# level.global_transform = out_global * parent2_from_in


	# level.global_rotation = global_rotation - level.in_node.global_rotation

	# level.position = global_position - level.in_node.global_position

	return level
