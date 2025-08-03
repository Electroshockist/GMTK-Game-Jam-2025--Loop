extends RayCast3D

class_name Interactor

signal on_interact(object: Node3D)

func _ready():
	GameManager.interactor = self

func _input(event):
	if (event.is_action_pressed("interact")):
		var collision := get_collider()

		if collision is Node:
			if (collision as Node).is_in_group("Interactable"):
				on_interact.emit(collision as Node)
