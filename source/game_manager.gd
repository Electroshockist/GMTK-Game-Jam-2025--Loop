extends Node

const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")

func _ready():
	_apply_shader_to_all(get_tree().root)
# func apply_shader_to_all_meshes(root: Node):
#     for node in _apply_shader_to_all(root):
#         if node is MeshInstance3D:
#             var mesh_instance = node as MeshInstance3D
#             var mesh: Mesh = mesh_instance.mesh
#             if mesh_instance == null:
#                 continue
#             var surface_count: int = mesh_instance.get_surface_override_material_count()
#             print(mesh_instance.name)
#             for i in surface_count:
#                 print("\t%s", mesh_instance.get_active_material(i))
#                 var material: Material = mesh_instance.get_active_material(i)
#                 var stdmat := StandardMaterial3D.new() if material == null else (material as StandardMaterial3D)
#                 var shader_material := ShaderMaterial.new()
#                 shader_material.shader = custom_shader
#                 if stdmat != null and stdmat.albedo_texture:
#                     print("t")
#                     shader_material.set_shader_parameter("albedo", stdmat.albedo_texture)
#                 mesh.surface_set_material(i, shader_material)

func _apply_shader_to_all(node: Node):
	for child in node.get_children():
		if (child is MeshInstance3D and child.get_script() == null):
			child.set_script(psx_shader_applicator)
		_apply_shader_to_all(child)
