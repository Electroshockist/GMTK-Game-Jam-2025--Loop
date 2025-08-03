extends Node

var _prev_level: Level
var _current_level: Level
var _next_level: Level

var _next_loadable_level_id: int = 0

@onready var _level_list = SceneManager.levels

func _on_new_level_enter():
	# close door
	# swap current level
	_prev_level.queue_free()
	_prev_level = _current_level
	_current_level = _next_level
	_next_level = null

func _on_level_load_trigger():
	var res: PackedScene = _level_list[_next_loadable_level_id]
	var level: Level = res.instantiate()
	level.position = _current_level.out_node.position + level.in_node.position
	get_tree().root.add_child(level)
	_next_level = level
