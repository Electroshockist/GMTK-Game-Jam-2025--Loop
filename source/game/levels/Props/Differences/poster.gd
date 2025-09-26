extends MeshInstance3D
const evil_texture := preload("res://assets/model/models/textures/Metro_PSX/PostersBAD.png")

func make_evil() -> void:
	(material_override as ShaderMaterial).set_shader_parameter("albedo", evil_texture)
