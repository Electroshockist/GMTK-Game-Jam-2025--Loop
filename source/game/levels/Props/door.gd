extends Node

class_name Door

@export var anim_player: AnimationPlayer

@export var load_area_on_close: bool = true

func _ready():
	anim_player.animation_finished.connect(_load_next_level)

func open():
	anim_player.play("Door_Open")

func close():
	anim_player.play("Door_Close")

func _load_next_level(anim_name: String):
	if (load_area_on_close and anim_name == "Door_Close"):
		GameManager.game.on_previous_door_closed()
