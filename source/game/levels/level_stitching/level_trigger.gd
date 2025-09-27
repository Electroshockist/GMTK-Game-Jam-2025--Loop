extends Area3D

class_name LevelTrigger

func _ready():
	body_entered.connect(
		func(body: Node3D):
			if body is Character:
				set_deferred("monitoring", false)
				if (GameManager.game != null):
					GameManager.game.close_door()
			)
