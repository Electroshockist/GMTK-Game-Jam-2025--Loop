extends Node3D
class_name Level

var in_node: Node3D
var out_node: OutNode

var _in_door: Door
@export var _out_door: Door

var in_door_name: StringName = "In Door"
var out_door_name: StringName = "Out Door"

func _ready():
	_set_nodes()

	GameManager.level_loaded(self)

func _set_nodes():
	var children := get_children(true)

	if !children.is_empty():
		for child in children:
			if (child.is_in_group("InNode")):
				in_node = child

func set_door(door: Door, is_out_door := false):
	door.reparent(self)

	if !is_out_door:
		_in_door = door
		_in_door.name = in_door_name
	else:
		_out_door = door
		_out_door.name = out_door_name

func close_door():
	# if (_out_door != null):
	_out_door.anim_player.play("Door_Close")

func on_anomaly_collected():
	$AudioStreamPlayer3D.play()
