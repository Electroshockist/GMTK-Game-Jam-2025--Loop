extends Node

enum SCENES {
	MAIN_MENU,
	GAME,
	OPTIONS,
	CREDITS
}

@onready var levels = [
	# preload("res://source/game/levels/level.tscn"),
	preload("res://source/game/levels/old_levels/level_01.tscn"),
	preload("res://source/game/levels/old_levels/level_02.tscn"),
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

func _ready():
	var triggers := get_tree().get_nodes_in_group("Level Trigger")
	if !triggers.is_empty():
		for trigger in triggers as Array[Area3D]:
				trigger.body_entered.connect(
					func(body: Node3D):
						if body is Character:
							LevelStitcher._on_level_load_trigger()
				)
