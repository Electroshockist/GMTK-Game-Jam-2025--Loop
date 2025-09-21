extends Node3D

class_name Interactable

signal on_interacted

@export var collider: CollisionShape3D
@export var label_sprite: Sprite3D
@export var subviewport: SubViewport
@export var label: Label

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_sprite.visible = false

func _process(_delta: float) -> void:
	subviewport.size = label.size

	label.text = OS.get_keycode_string(
		DisplayServer.keyboard_get_keycode_from_physical(
			InputMap.action_get_events("interact")[0].physical_keycode
		)
	)

func set_hovered_state(is_hovering: bool):
	label_sprite.visible = is_hovering

func on_interact():
	_on_interact_action()
	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
