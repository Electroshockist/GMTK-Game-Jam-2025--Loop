extends Node

class_name Interactable

@onready var collider := $Collider
@onready var label := $Collider/CollisionShape3D/Sprite3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	GameManager.interactor.on_interact.connect(
		func(node: Node):
			if (node == collider):
				_on_interact()
	)

func set_hovered_state(is_hovering: bool):
	label.visible = is_hovering

# abstract function to override
func _on_interact():
	pass
