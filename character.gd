extends CharacterBody3D

@onready var camera = $Camera3D
const MOVEMENT_SPEED = 4
const FALL_SPEED = 981
const MAX_VELOCITY_MOUSE = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event : InputEvent):
	
	if (event is InputEventMouseMotion):
		var sensitivity = 0.005
		var mouse_velocity = event.relative.x
		#var mouse_velocity = event.velocity.x
		#if (abs(mouse_velocity) > MAX_VELOCITY_MOUSE):
			#if (mouse_velocity > 0):
				#mouse_velocity = MAX_VELOCITY_MOUSE
			#else: 
				#mouse_velocity = -MAX_VELOCITY_MOUSE
		print(event.relative.x-event.velocity.x)
		rotate_y(deg_to_rad(-mouse_velocity * camera.mouse_sens))

func _process(delta) -> void:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		position.x += direction.x * MOVEMENT_SPEED * delta
		position.z += direction.z * MOVEMENT_SPEED * delta
	velocity.y -= FALL_SPEED * delta
	move_and_slide()
