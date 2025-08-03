extends Node

enum SCENES {
	MAIN_MENU,
	GAME,
	OPTIONS,
	CREDITS
}

var levels = [ # preload("res://source/game/levels/level_01.tscn"),
	# preload("res://source/game/levels/level_02.tscn")
	# preload("res://source/game/levels/level_01_02.tscn"),
	# preload("res://source/game/levels/level_01_03.tscn"),
	# preload("res://source/game/levels/level_01_04.tscn"),
	# preload("res://source/game/levels/level_01_05.tscn"),
	# preload("res://source/game/levels/level_01_06.tscn"),
	# preload("res://source/game/levels/level_01_07.tscn"),
	# preload("res://source/game/levels/level_01_08.tscn"),
	# preload("res://source/game/levels/level_01_09.tscn"),
	# preload("res://source/game/levels/level_01_10.tscn")
	]

var packed_scenes := {
	SCENES.MAIN_MENU: preload("res://source/UI/main_menu.tscn"),
	SCENES.GAME: preload("res://source/game/levels/old_levels/level_01.tscn"),
	SCENES.OPTIONS: preload("res://source/UI/options.tscn"),
	SCENES.CREDITS: preload("res://source/UI/credits.tscn"),
}

func change_scene(scene: SCENES):
	get_tree().change_scene_to_packed(packed_scenes[scene])

func on_interatable_collected():
	pass
