extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(
		func(body: Node3D):
			if body is Character:
				LevelStitcher._on_level_load_trigger()
	)
