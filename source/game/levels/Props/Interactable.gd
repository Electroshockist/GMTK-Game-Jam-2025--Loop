@tool
extends Node3D

class_name Interactable

signal on_interacted

@export_enum("Area3D", "StaticBody3D") var is_area3D: int = 0:
	get:
		return is_area3D
	set(value):
		is_area3D = value

		var orig = $Root/Collider
		var new = orig
		if (value == 0 && !orig is Area3D):
			new = Area3D.new()
		elif (value == 1 && !orig is StaticBody3D):
			new = StaticBody3D.new()
		
		print(name)
		if new != orig:
			new.name = orig.name

			orig.replace_by(new)
			orig.queue_free()

@export var shape: Shape3D:
	get:
		return shape
	set(value):
		shape = value
		if $Root/Collider/Collision.shape != shape:
			$Root/Collider/Collision.shape = shape
@export var on_interact_audio: AudioStream

@onready var label_sprite: Sprite3D = $Root/Collider/Collision/Sprite3D
@onready var subviewport: SubViewport = $Root/Collider/Collision/Sprite3D/SubViewport
@onready var label: Label = $Root/Collider/Collision/Sprite3D/SubViewport/Label
@onready var audio_stream_player: AudioStreamPlayer3D = $Root/AudioStreamPlayer3D

var is_monitorable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	(label_sprite.texture as ViewportTexture).viewport_path = subviewport.get_path()
	label_sprite.visible = false

	if OS.has_feature("editor_hint"):
		process_mode = Node3D.PROCESS_MODE_DISABLED
	else:
		process_mode = Node3D.PROCESS_MODE_INHERIT

func _process(_delta: float) -> void:
	subviewport.size = label.size

	label.text = "[%s]" % OS.get_keycode_string(
		DisplayServer.keyboard_get_keycode_from_physical(
			InputMap.action_get_events("interact")[0].physical_keycode
		)
	)

func set_hovered_state(is_hovering: bool):
	label_sprite.visible = is_hovering

func on_interact():
	_on_interact_action()
	if on_interact_audio:
		audio_stream_player.stream = on_interact_audio
		audio_stream_player.play()
	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
