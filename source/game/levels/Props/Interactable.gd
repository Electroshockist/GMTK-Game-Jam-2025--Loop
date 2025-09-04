extends Node

class_name Interactable

@onready var collider := $Collider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.interactor.on_interact.connect(
		func(node: Node):
			if (node == collider):
				_on_interact()
	)

func _on_interact():
	pass
