extends RayCast3D


func _input(event):
    if (event.is_action_pressed("interact")):
        var collision := get_collider()
        if collision is Interactable:
            pass
