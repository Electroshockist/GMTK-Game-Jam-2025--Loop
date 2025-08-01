extends SubViewport

@export var camera: Camera3D

@export var render_surface: Node3D

### The world that is rendered
@export var world: Node3D

@onready var internal_camera: Camera3D = $Node3D/Camera3D


# var _offset := Vector3(1000, -1000, 1000)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	internal_camera = camera.duplicate()
	add_child(internal_camera)
	# for child in get_children():
	# 	if child is Node3D:
	# 		(child as Node3D).position += _offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	internal_camera.rotation = camera.rotation
	internal_camera.position = camera.global_position - render_surface.global_position # + _offset
