extends Node3D

class_name Game

@export var delete_on_load: Array[Node3D]

var levels = [
	load("res://source/game/levels/level_00.tscn"),
	load("res://source/game/levels/level_01.tscn"),
	load("res://source/game/levels/level_02.tscn"),
	load("res://source/game/levels/level_03.tscn"),
	load("res://source/game/levels/level_04.tscn"),
	load("res://source/game/levels/level_05.tscn"),
	load("res://source/game/levels/level_06.tscn"),
	load("res://source/game/levels/level_07.tscn"),
	load("res://source/game/levels/level_08.tscn"),
	load("res://source/game/levels/level_09.tscn"),
	load("res://source/game/levels/level_10.tscn")
]

## the id of the level that the player is currently in
var current_level_id: int = 0

## the id of the next level to be loaded
var next_level_id: int = 0

## the current level in the loop
var current_level: Level

## the next level in the loop
var next_level: Level

func _init():
	GameManager.game = self

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_level = _spawn_level(0)
	current_level.name = "Current Level"

	_spawn_next_level()
	current_level.out_node.transform_level(next_level)
	
	(current_level.find_child("Level trigger") as LevelTrigger).monitoring = false

## loads the initial level
func _spawn_level(id: int) -> Level:
	var l = levels[id].instantiate()
	add_child(l)

	return l

func _spawn_next_level():
	next_level = _spawn_level(next_level_id)
	next_level.name = "Next Level"

func on_enter_next_level():
	if !delete_on_load.is_empty():
		for i in delete_on_load:
			i.queue_free()
			delete_on_load.erase(i)

	_swap_level()
	_spawn_next_level()
	current_level.out_node.transform_level(next_level)

func _swap_level():
	next_level.set_door(current_level._out_door)
	current_level.queue_free()

	current_level_id = next_level_id
	current_level = next_level
	current_level.name = "Current Level"

func close_door():
	current_level.close_door()

## call when the conditions to set the next level are met
## sets the next loaded level to be the next level in the list
func anomaly_collected():
	current_level.on_anomaly_collected()

	next_level_id = current_level_id + 1;
	next_level.queue_free()
	_spawn_next_level()
	current_level.out_node.transform_level(next_level)

var is_debug_cam_on = false
func _input(_event):
	if !OS.has_feature("standalone"):
		if (Input.is_action_just_pressed("DebugCamToggle")):
			is_debug_cam_on = !is_debug_cam_on
			var charcam := GameManager.character.camera
			var debugcam := find_child("DebugCamera3D") as Camera3D

			if (is_debug_cam_on):
				debugcam.make_current()
			else:
				charcam.make_current()
