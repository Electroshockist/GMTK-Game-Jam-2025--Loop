extends Node

var _prev_level: Level
var _current_level: Level
var _next_level: Level

var _next_loadable_level_id: int = 0

var _level_list := [
	preload("res://source/game/levels/level_01_01.tscn"),
	preload("res://source/game/levels/level_01_02.tscn"),
	preload("res://source/game/levels/level_01_03.tscn"),
	preload("res://source/game/levels/level_01_04.tscn"),
	preload("res://source/game/levels/level_01_05.tscn"),
	preload("res://source/game/levels/level_01_06.tscn"),
	preload("res://source/game/levels/level_01_07.tscn"),
	preload("res://source/game/levels/level_01_08.tscn"),
	preload("res://source/game/levels/level_01_09.tscn"),
	preload("res://source/game/levels/level_01_10.tscn"),
]

func ready():
	pass

func load_next_level():
	pass

func _on_new_level_enter():
	# close door
	# swap current level
	_prev_level.queue_free()
	_prev_level = _current_level
	_next_level = null


func _on_level_load_trigger():
	_next_level = _level_list[_next_loadable_level_id]