extends Area3D

class_name LevelTrigger

func _ready():
	body_entered.connect(
		func(body: Node3D):
			if body is Character:
				set_deferred("monitoring", false)
				if (GameManager.game != null):
					# close the level's door, 
					# then allow the door to notify the game that it has finished closing
					# this makes it so that the level doesn't unload before it is no longer visible
					GameManager.game.close_door()
	)
