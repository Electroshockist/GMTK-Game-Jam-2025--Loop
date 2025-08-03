extends Node

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

func change_scene(scene: SCENES):
	get_tree().change_scene_to_packed(packed_scenes[scene])

func on_interatable_collected():
	pass