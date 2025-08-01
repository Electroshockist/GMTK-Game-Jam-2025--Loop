extends CharacterBody3D
class_name Character

@export var camera: Camera3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const LOOK_SENSITIVITY = 0.5

var _input_enabled: bool = true

func _ready():
	GameManager.character = self
	
	GameManager.set_mouse_lock(true)
	
	GameManager.menu_toggled.connect(
		func():
			_input_enabled = !_input_enabled
	)

func _input(event):
	if _input_enabled:
		if event is InputEventMouseMotion:
			rotation_degrees.y -= event.relative.x * LOOK_SENSITIVITY
			camera.rotation_degrees.x -= event.relative.y * LOOK_SENSITIVITY
			
			camera.rotation_degrees.x = clampf(camera.rotation_degrees.x, -90, 90);
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = _get_direction()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _get_direction() -> Vector3:
	var direction := Vector3.ZERO
	if _input_enabled:
		# Get the input direction and handle the movement/deceleration.
		var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	return direction