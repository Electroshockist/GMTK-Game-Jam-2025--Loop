extends Interactable

class_name Door

@export var anim_player: AnimationPlayer
@onready var character_anims : Node3D = $/source/game/Character/character_anims
@onready var animation_tree : AnimationTree= $"../CharacterBody3D/AnimationTree"

func _ready() -> void:
	super._ready()
	anim_player.animation_finished.connect(
		func(anim_name: String):
			if (anim_name == "Door_Close"):
				GameManager.game.on_enter_next_level()
				is_monitorable = false
	)

func on_interact():
	var state_machine = animation_tree["parameters/playback"]
	state_machine.travel('arms_anim_doorpush')
	await get_tree().create_timer(.3).timeout
	anim_player.play("Door_Open")
	await get_tree().create_timer(.7).timeout
	state_machine.travel('arms_anim_loop_idle')
