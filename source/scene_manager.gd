extends Node

var level_handler: LevelHandler

enum SCENES {
	MAIN_MENU,
	GAME,
	OPTIONS,
	CREDITS
}

var packed_scenes := {
	SCENES.MAIN_MENU: preload("res://source/game/game.tscn"),
	SCENES.GAME: preload("res://source/game/game.tscn"),
	SCENES.OPTIONS: preload("res://source/UI/options.tscn"),
	SCENES.CREDITS: preload("res://source/UI/credits.tscn")
}

# func _ready():
# 	level_handler.ready()


func change_scene(scene: SCENES):
	get_tree().change_scene_to_packed(packed_scenes[scene])

func on_interatable_collected():
	pass

class LevelHandler:
	var levels: Array[PackedScene] = [

	]

	var _next_loadable_level_id: int = 0

	func ready():
		pass

	func load_next_level():
		pass
