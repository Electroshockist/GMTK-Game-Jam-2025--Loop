@tool
extends MeshInstance3D

var shader: Shader = preload("res://assets/shaders/psx_shader.gdshader")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_apply_shader()

func _apply_shader():
	var surface_count: int = get_surface_override_material_count()

	for i in surface_count:
		var material := mesh.surface_get_material(i)
		var stdmat := StandardMaterial3D.new() if material == null else material as StandardMaterial3D
		var shader_material := ShaderMaterial.new()
		shader_material.shader = shader
		
		_handle_albedo(stdmat, shader_material)
		_handle_emission(stdmat, shader_material)

		mesh.surface_set_material(i, shader_material)

func _handle_albedo(mat: StandardMaterial3D, shader_material: ShaderMaterial):
	if mat.albedo_texture:
		shader_material.set_shader_parameter("albedo", mat.albedo_texture)

func _handle_emission(mat: StandardMaterial3D, shader_material: ShaderMaterial):
	if mat.emission_enabled:
		shader_material.set_shader_parameter("emission_color", mat.emission_energy_multiplier)
		if mat.emission_texture != null:
			shader_material.set_shader_parameter("emission", mat.emission_texture)
