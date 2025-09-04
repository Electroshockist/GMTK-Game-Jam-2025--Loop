extends Node

var _prev_level: Level
var _current_level: Level
var _next_level: Level

var _next_loadable_level_id: int = 0

var activeOutNode: Node
var activeInNode: Node

## When a new level is entered, close door,
## set the level that was just exited to the prevoius level
## and delete the former previous level
func _on_new_level_enter():
	# TODO: close door
	# swap current level
	_prev_level.queue_free()
	_prev_level = _current_level
	_current_level = _next_level
	_next_level = null

## When the next level should be loaded
func _on_level_load_trigger():
	var res: PackedScene = SceneManager.levels[_next_loadable_level_id]
	var level := res.instantiate()
	level.position = _current_level.out_node.position + level.in_node.position
	get_tree().root.add_child(level)
	_next_level = level
