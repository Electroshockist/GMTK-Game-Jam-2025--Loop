extends Interactable

class_name Door

@onready var anim_p: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	super._ready()
	anim_p.animation_finished.connect(
		func(anim_name: String):
			if (anim_name == "Door_Close"):
				var o: Level = owner
				o.on_door_anim_finish()
	)

func on_interact():
	anim_p.play("Door_Open")
