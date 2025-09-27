extends Node3D

class_name Interactable

signal on_interacted


@export var is_area3D: bool = false
@export var on_interact_audio: AudioStream

@onready var h: InteractableHelper = $Root

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (!is_area3D):
		var area = $Root/Collider
		var coll = StaticBody3D.new()
		coll.name = area.name

		area.replace_by(coll)
	
	(h.label_sprite.texture as ViewportTexture).viewport_path = h.subviewport.get_path()
	h.label_sprite.visible = false

func _process(_delta: float) -> void:
	h.subviewport.size = h.label.size

	h.label.text = "[%s]" % OS.get_keycode_string(
		DisplayServer.keyboard_get_keycode_from_physical(
			InputMap.action_get_events("interact")[0].physical_keycode
		)
	)

func set_hovered_state(is_hovering: bool):
	h.label_sprite.visible = is_hovering

func on_interact():
	_on_interact_action()
	if on_interact_audio:
		h.audio_stream_player.stream = on_interact_audio
		h.audio_stream_player.play()
	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
