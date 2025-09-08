extends Node

class_name Interactable

@export var collider: CollisionShape3D
@export var label: Sprite3D

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false

func set_hovered_state(is_hovering: bool):
	label.visible = is_hovering

# abstract function to override
func on_interact():
	pass
