extends Node

enum SCENES {
	MAIN_MENU,
	GAME,
	OPTIONS,
	CREDITS,
	DEMO_END
}

signal scene_changed(scene: SCENES)

@onready var packed_scenes := {
	SCENES.MAIN_MENU: preload("res://source/UI/main_menu.tscn"),
	SCENES.GAME: preload("res://source/game/levels/level_00.tscn"),
	SCENES.OPTIONS: preload("res://source/UI/options.tscn"),
	SCENES.CREDITS: preload("res://source/UI/credits.tscn"),
	SCENES.DEMO_END: preload("res://source/UI/demo_end.tscn")
}

func change_scene(scene: SCENES):
	get_tree().change_scene_to_packed(packed_scenes[scene])
	scene_changed.emit(scene)