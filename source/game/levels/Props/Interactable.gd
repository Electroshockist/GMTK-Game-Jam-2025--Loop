extends Node3D

class_name Interactable

signal on_interacted


@export var is_area3D: bool = false
@export var on_interact_audio: AudioStream


@onready var collider: CollisionShape3D = $Root/Collider/Collision
@onready var label_sprite: Sprite3D = $Root/Collider/Collision/Sprite3D
@onready var subviewport: SubViewport = $Root/Collider/Collision/Sprite3D/SubViewport
@onready var label: Label = $Root/Collider/Collision/Sprite3D/SubViewport/Label
@onready var _audio_stream_player: AudioStreamPlayer3D = $Root/AudioStreamPlayer3D

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (is_area3D):
		var coll = $Root/Collider
		var area = Area3D.new()
		area.name = coll.name

		coll.replace_by(area)
	
	(label_sprite.texture as ViewportTexture).viewport_path = subviewport.get_path()
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
	if on_interact_audio:
		_audio_stream_player.stream = on_interact_audio
		_audio_stream_player.play()
	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
