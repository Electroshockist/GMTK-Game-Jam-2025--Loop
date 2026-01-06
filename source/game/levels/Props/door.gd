extends Node

class_name Door

@export var interactable: Interactable

@export var anim_player: AnimationPlayer

@export var load_area_on_close: bool = true:
	get:
		return load_area_on_close
	set(value):
		load_area_on_close = value

		if value:
			anim_player.animation_finished.connect(_load_next_level)

		elif anim_player.animation_finished.is_connected(_load_next_level):
			anim_player.animation_finished.disconnect(_load_next_level)

func open():
	anim_player.play("Door_Open")

func close():
	anim_player.play("Door_Close")

func _load_next_level(anim_name: String):
	if (anim_name == "Door_Close"):
		GameManager.game.on_enter_next_level()
