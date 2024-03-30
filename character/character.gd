extends CharacterBody3D

@onready var camera : Camera3D = $Camera3D
@onready var ray_cast : RayCast3D = get_node("Camera3D/RayCast3D")
const MOVEMENT_SPEED : int = 4
const FALL_SPEED : int = 981
const MAX_VELOCITY_MOUSE : int = 25
var prev_collider : Object = null
var collider : Object = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event : InputEvent):
	if (event is InputEventMouseMotion):
		var sensitivity = 0.005
		var mouse_velocity = event.relative.x
		rotate_y(deg_to_rad(-mouse_velocity * camera.mouse_sens))

func _process(delta) -> void:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var pause : bool = false
	if !(pause):
		if direction:
			position.x += direction.x * MOVEMENT_SPEED * delta
			position.z += direction.z * MOVEMENT_SPEED * delta
		velocity.y -= FALL_SPEED * delta
		
		if (ray_cast.is_colliding()):
			prev_collider = collider
			collider = ray_cast.get_collider()
		else :
			collider = null
	if (Input.is_action_just_pressed("interact") and collider != null):
		if (pause == false):
			collider.pick_up()
			pause = true
		else :
			collider.put_down()
			pause = false
	move_and_slide()

#func raycast() -> Array[]
