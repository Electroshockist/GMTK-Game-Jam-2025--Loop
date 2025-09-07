extends Node3D

class_name Game

const door_scene := preload("res://source/game/levels/Props/door_metal.tscn")

var prevdoor: Door
var nextdoor: Door

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game = self

	_load_init_level()
	create_door()
	_spawn_next_level()

## loads the initial level
func _load_init_level():
	current_level = load("res://source/game/levels/initial_level.tscn").instantiate()
	get_tree().current_scene.add_child(current_level)

func _spawn_next_level():
	next_level = levels[next_level_id].instantiate()
	
	get_tree().current_scene.add_child(next_level)

	current_level.transform_level(next_level)

func on_enter_next_level():
	current_level.queue_free()
	current_level = next_level
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

	door.global_rotation = current_level.out_node.global_rotation
	door.global_position = current_level.out_node.global_position

	nextdoor = door
	get_tree().current_scene.add_child(nextdoor)

func close_prev_door():
	prevdoor.queue_free()
	prevdoor = nextdoor

	prevdoor.anim_p.play("Door_Close")