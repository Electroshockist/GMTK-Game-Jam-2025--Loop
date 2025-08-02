@tool
extends Node3D

## The world that is rendered
@export var world: PackedScene

@export var camera: Camera3D

@onready var render_texture: Sprite3D = $"Render Texture"

@onready var internal_camera: Camera3D = $"Render Viewport/Node3D/Camera3D"

const shader := preload("res://assets/shaders/render_viewport.gdshader")

var _viewport_texture: ViewportTexture

func _ready():
	$"Render Viewport/Node3D".add_child(world.instantiate())

	# _viewport_texture = ViewportTexture.new()
	# _viewport_texture.viewport_path = $"Render Viewport".get_path()

	# render_texture.texture = _viewport_texture

	# var material := ShaderMaterial.new()
	# material.shader = shader
	# material.set_shader_parameter("texture_albedo", _viewport_texture)
	# render_texture.material_override = material

func _process(_delta: float) -> void:
	## external camera
	var cam: Camera3D = camera
	if Engine.is_editor_hint():
		cam = EditorInterface.get_editor_viewport_3d().get_camera_3d()

	var trans := internal_camera.global_transform * cam.global_transform
	# internal_camera.global_position = camera.global_position - render_texture.global_position
	# internal_camera.rotation = camera.rotation
