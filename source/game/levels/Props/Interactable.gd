extends Node3D

class_name Interactable

signal on_interacted

@export var collider: CollisionShape3D
@export var label: Sprite3D

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false

func set_hovered_state(is_hovering: bool):
	label.visible = is_hovering

func on_interact():
	_on_interact_action()
	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
