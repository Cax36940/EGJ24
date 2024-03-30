extends CharacterBody3D

var camera
const MOVEMENT_SPEED = 5
const FALL_SPEED = 981

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

func _input(event : InputEvent):
	if (event is InputEventMouseMotion):
		rotate_y(deg_to_rad(-event.relative.x*$Camera3D.mouse_sens))

func _process(delta) -> void:
	
	print(position) 
	#var camera_pos = Vector2
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		position.x += direction.x * MOVEMENT_SPEED * delta
		position.z += direction.z * MOVEMENT_SPEED * delta
	velocity.y -= FALL_SPEED * delta
	move_and_slide()
