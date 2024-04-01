extends CharacterBody3D

@onready var camera : Camera3D = $Camera3D
@onready var ray_cast : RayCast3D = $Camera3D/interaction
@onready var ray_cast_highlighter : RayCast3D = $Camera3D/highlight
const MOVEMENT_SPEED : int = 4
const FALL_SPEED : int = 9.8
const MAX_VELOCITY_MOUSE : int = 25
var prev_collider : Object = null
var collider : Object = null
var pause : bool = false
var is_interacting : bool = false
var steps : Node3D = null
var is_ending : bool = false
var prev_paths : Node3D = null 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta) -> void:
	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if !(is_ending):
		if !(pause):
			if direction:
				position.x += direction.x * MOVEMENT_SPEED * delta
				position.z += direction.z * MOVEMENT_SPEED * delta
			velocity.y -= FALL_SPEED * delta
			if (ray_cast.is_colliding()):
				collider = ray_cast.get_collider()
				if !(collider is Npc):
					collider = collider.get_parent()
			else :
				if (collider != null): collider.is_pointing = false
				collider = null
			if (ray_cast_highlighter.is_colliding()):
				if (steps != null):
					var prev_paths = steps.get_parent().get_parent().get_parent()
					steps = ray_cast_highlighter.get_collider()
					var paths = steps.get_parent().get_parent().get_parent()
					print(paths)
					if (prev_paths.highlighted and prev_paths != paths): prev_paths.toggle_highlight()
					if !(paths.highlighted): paths.toggle_highlight()
				else :
					steps = ray_cast_highlighter.get_collider()
					var paths = steps.get_parent().get_parent().get_parent()
					
					
				#if (prev_paths != null and prev_paths != paths and prev_paths.highlighted) : prev_paths.toggle_highlight()
				## Appeler fonction mettre highlight
				#prev_paths = null
					if !(paths.highlighted): paths.toggle_highlight()
			else :
				if (steps != null): 
					var paths = steps.get_parent().get_parent().get_parent()
					prev_paths = paths
					if (paths.highlighted): paths.toggle_highlight()
				#steps = null
		if (collider != null):
			collider.is_pointing = true
			if (Input.is_action_just_pressed("interact") and collider != null and !is_interacting):
				if (pause == false):
					## Engage le PNJ --> intéragie
					if (collider is Npc):
						collider.engage(self)
						$UI/Control.visible = true
						Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
					
					## Prend un objet
					else: 
						collider.pick_up(self)
						collider.get_node(collider.path).visible = true
						collider.is_interacting = true
					pause = true
					
				else :
					### Pose un Objet
					if !(collider is Npc):
						collider.put_down(self)
						collider.is_interacting = false
						pause = false
		move_and_slide()

func disengage(_collider : Object):
	$UI/Control.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_interacting = false
	pause = false

func _on_detain_pressed():
	collider.detain(self)


func _on_follow_pressed():
	collider.follow()
	disengage(collider)
