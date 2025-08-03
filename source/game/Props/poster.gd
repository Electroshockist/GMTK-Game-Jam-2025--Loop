extends MeshInstance3D

@export var is_evil: bool = false

const evil_texture := preload("res://assets/model/Metro_PSX/Textures/PostersBAD.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_evil:
		pass