extends Node

func _ready():
    pass

func apply_albedo_from_existing(material: ShaderMaterial, from_material: StandardMaterial3D):
    var tex := from_material.albedo_texture
    material.set_shader_parameter("albedo_texture", tex)
