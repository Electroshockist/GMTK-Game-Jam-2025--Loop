@tool
extends Node3D

func _ready():
	var out_dir := "res://assets/Metro_PSX/Metro_PSX/Models/Metro_slipt/"

	# Make the folder if it doesn't exist
	if not DirAccess.dir_exists_absolute(out_dir):
		DirAccess.make_dir_absolute(out_dir)

	for child in get_children():
		# Optional: Skip non-mesh nodes
		if child is MeshInstance3D or child is Node3D:
			var packed_scene := PackedScene.new()
			if packed_scene.pack(child) == OK:
				var save_path := out_dir + child.name + ".tscn"
				var result := ResourceSaver.save(packed_scene, save_path) # <- swapped order!
				if result == OK:
					print("✅ Saved:", save_path)
				else:
					print("❌ Failed to save:", child.name)
			else:
				print("⚠️ Couldn't pack:", child.name)
