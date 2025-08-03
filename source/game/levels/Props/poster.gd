extends MeshInstance3D

enum STATES {
	NORMAL,
	EVIL,
	FALLEN
}

@export var state: STATES

@export var fallen_state: Node3D

const evil_texture := preload("res://assets/model/Metro_PSX/Textures/PostersBAD.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if state == STATES.EVIL:
		pass