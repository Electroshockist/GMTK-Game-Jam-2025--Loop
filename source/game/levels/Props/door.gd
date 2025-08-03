extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.interactor.on_interact.connect(
		func(node: Node):
			if (node == self):
				var anim_p := $SerwersP_013/AnimationPlayer
				anim_p.play("Door_Open")
	)
