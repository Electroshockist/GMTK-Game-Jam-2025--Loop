extends Node3D

class_name Game

const door_scene := preload("res://source/game/levels/Props/door_metal.tscn")

var prevdoor: Door
var nextdoor: Door

signal on_load_new_door(door: Door)

var levels = [
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
	create_door()
	
	(current_level.find_child("Level trigger") as LevelTrigger).monitoring = false

## loads the initial level
func _spawn_level(id: int) -> Level:
	var l = levels[id].instantiate()
	add_child(l)

	return l

func _spawn_next_level():
	next_level = _spawn_level(next_level_id)
	next_level.name = "Next Level"
	current_level.transform_level(next_level)

func on_enter_next_level():
	current_level.queue_free()
	current_level = next_level
	current_level.name = "Next Level"
	_spawn_next_level()
	create_door()

## call when the conditions to set the next level are met
## sets the next loaded level to be the next level in the list
func increment_next_level():
	next_level_id += 1;
	next_level.queue_free()
	_spawn_next_level()

func create_door():
	var door: Door = door_scene.instantiate()

	add_child(door)

	door.global_rotation = next_level.global_rotation
	door.global_position = current_level.out_node.global_position

	door.anim_player.play("RESET")

	nextdoor = door
	on_load_new_door.emit(door)

func close_prev_door():
	if (prevdoor != null):
		prevdoor.queue_free()
	nextdoor.anim_player.play("Door_Close")
	prevdoor = nextdoor


var sum = 0

func _process(delta):
	sum += delta
	if (sum > 1):
		sum = 0
		current_level.transform_level(next_level)


var is_debug_cam_on = false
func _input(event):
	if !OS.has_feature("standalone"):
		if (Input.is_action_just_pressed("DebugCamToggle")):
			is_debug_cam_on = !is_debug_cam_on
			var charcam := (GameManager.character.find_child("MainCamera3D") as Camera3D)
			var debugcam := find_child("DebugCamera3D") as Camera3D

			if (is_debug_cam_on):
				debugcam.make_current()
			else:
				charcam.make_current()
			print(get_viewport().get_camera_3d().name)
