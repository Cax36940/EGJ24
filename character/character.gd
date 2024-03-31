extends CharacterBody3D

@onready var camera : Camera3D = $Camera3D
@onready var ray_cast : RayCast3D = $Camera3D/RayCast3D
const MOVEMENT_SPEED : int = 4
const FALL_SPEED : int = 9.8
const MAX_VELOCITY_MOUSE : int = 25
var prev_collider : Object = null
var collider : Object = null
var pause : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta) -> void:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if !(pause):
		if direction:
			position.x += direction.x * MOVEMENT_SPEED * delta
			position.z += direction.z * MOVEMENT_SPEED * delta
		velocity.y -= FALL_SPEED * delta
		if (ray_cast.is_colliding()):
			collider = ray_cast.get_collider()
		else :
			if (collider != null): collider.is_pointing = false
			collider = null
	if (collider != null):
		collider.is_pointing = true
		if (Input.is_action_just_pressed("interact") and collider != null):
			if (pause == false):
				if (collider is Npc):
					collider.engage(self)
					$UI/Control.visible = true
					Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				else: 
					collider.pick_up(self)
					collider.get_node("mesh/outline").visible = true
					collider.is_interacting = true
				pause = true
			else :
				if (collider is Npc):
					disengage(self,collider)
				else: 
					collider.put_down(self)
					collider.is_interacting = false
				pause = false
	move_and_slide()

func disengage(_self : CharacterBody3D, _collider : Object):
	_collider.disengage(_self)
	$UI/Control.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_detain_pressed():
	collider.detain()


func _on_follow_pressed():
	collider.follow()
	disengage(self,collider)
	pause = false
