extends Node

const char_scene := preload("res://source/game/character/character.tscn")

var character: Character

var game: Game

var menu_manager

func level_loaded(level: Node3D) -> void:
	call_deferred("_create_character", level)
		
func _create_character(level: Node3D):
	if (character == null):
		for child in level.get_children(true):
			if child.is_in_group("PlayerSpawn"):
				character = char_scene.instantiate() as Character

				get_tree().root.add_child(character)
				character.global_transform = child.global_transform
				character.global_rotation = child.global_rotation

				character.camera.current = true
				break
# const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")
# func _ready():
	# _apply_shader_to_all(get_tree().root)
# func _apply_shader_to_all(node: Node):
# 	for child in node.get_children(true):
# 		if (child is MeshInstance3D and child.get_script() == null):
# 			child.set_script(psx_shader_applicator)
# 		_apply_shader_to_all(child)
