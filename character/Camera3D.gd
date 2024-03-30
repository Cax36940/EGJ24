extends Camera3D

@onready var character : CharacterBody3D = get_parent()
var mouse_sens : float = 0.15
var camera_anglev : float = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = character.position.y
	position.x = character.position.x

func _input(event : InputEvent):
	print(Input.get_last_mouse_velocity())
	if event is InputEventMouseMotion :
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			rotate_x(deg_to_rad(changev))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
