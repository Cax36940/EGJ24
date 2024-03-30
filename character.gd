extends CharacterBody3D

var camera
const SPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

func _input(event : InputEvent):
	if (event is InputEventMouseMotion):
		rotate_y(deg_to_rad(-event.relative.x*$Camera3D.mouse_sens))

func _process(delta) -> void:
	
	print(rotation_degrees) 
	#var camera_pos = Vector2
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		position.x += direction.x * SPEED * delta
		position.z += direction.z * SPEED * delta
	move_and_slide()
