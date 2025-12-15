# @tool

extends Node3D

class_name InteractableInputDisplay

@export var interactable: Interactable

@export var interact_action: StringName

@onready var label_sprite: Sprite3D = $Sprite3D
@onready var subviewport: SubViewport = $Sprite3D/SubViewport
@onready var label: Label = $Sprite3D/SubViewport/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	(label_sprite.texture as ViewportTexture).viewport_path = subviewport.get_path()
	label_sprite.visible = false

	interactable.on_hover_state_set.connect(set_hovered_state)
	
func _process(_delta):
	# # disable processing in editor
	# if OS.has_feature("editor_hint"):
	# 	process_mode = Node3D.PROCESS_MODE_DISABLED
	# else:
	# 	process_mode = Node3D.PROCESS_MODE_INHERIT
	subviewport.size = label.size

	label.text = "[%s]" % OS.get_keycode_string(
		DisplayServer.keyboard_get_keycode_from_physical(
			InputMap.action_get_events(interact_action)[0].physical_keycode
		)
	)

func set_hovered_state(is_hovering: bool):
	label_sprite.visible = is_hovering
