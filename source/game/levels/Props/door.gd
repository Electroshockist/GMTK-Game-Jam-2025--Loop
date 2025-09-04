extends Interactable
@onready var anim_p: AnimationPlayer = $AnimationPlayer

func _on_interact():
	anim_p.play("Door_Open")
