extends Node

var character: Character

var game: Game

var menu_manager

# const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")

# func _ready():
	# _apply_shader_to_all(get_tree().root)

# func _apply_shader_to_all(node: Node):
# 	for child in node.get_children(true):
# 		if (child is MeshInstance3D and child.get_script() == null):
# 			child.set_script(psx_shader_applicator)
# 		_apply_shader_to_all(child)
