@tool
extends Interactable

class_name Door

@export var anim_player: AnimationPlayer

func _ready() -> void:
	super._ready()
	anim_player.animation_finished.connect(
		func(anim_name: String):
			if (anim_name == "Door_Close"):
				GameManager.game.on_enter_next_level()
				is_monitorable = false
	)

func _on_interact_action():
	anim_player.play("Door_Open")

func get_interact_text() -> String:
	return ""