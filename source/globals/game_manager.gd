extends Node

signal game_created()

const game_scene := preload("res://source/game/game.tscn")

const char_scene := preload("res://source/game/character/character.tscn")

var character: Character

var game: Game

var menu_manager

func on_level_loaded(level: Level) -> void:
	# load game if none exist
	if game == null:
		_create_game.call_deferred(level)

	# load char if none exist
	if character == null:
		_create_character.call_deferred(level)
		
func _create_game(level: Level):
	game = game_scene.instantiate()
	game.current_level_property = level
	level.reparent(game)
	get_tree().root.add_child(game)
	game_created.emit()

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

# func on_level_loaded(anomaly: Anomaly):

# const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")
# func _ready():
	# _apply_shader_to_all(get_tree().root)
# func _apply_shader_to_all(node: Node):
# 	for child in node.get_children(true):
# 		if (child is MeshInstance3D and child.get_script() == null):
# 			child.set_script(psx_shader_applicator)
# 		_apply_shader_to_all(child)
