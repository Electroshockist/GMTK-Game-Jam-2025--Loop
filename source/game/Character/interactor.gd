extends RayCast3D

class_name Interactor

signal on_interact(object: Node3D)

func _ready():
	GameManager.interactor = self

func _input(_event):
	if (Input.is_action_just_pressed("interact")):
		var collision := get_collider()

		if collision is Node:
			if (collision as Node).is_in_group("Interactable"):
				on_interact.emit(collision as Node)
