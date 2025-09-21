extends MeshInstance3D
const evil_texture := preload("res://assets/model/models/textures/Metro_PSX/PostersBAD.png")

@export var anomaly: Node3D


func become_evil():
	(material_override as ShaderMaterial).set_shader_parameter("albedo", evil_texture)