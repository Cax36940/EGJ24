extends Camera3D

@onready var character : CharacterBody3D = get_parent()
var mouse_sens : float = 0.15
var camera_anglev : float = 0 
var ray_length : int = 100
var nb_ray : int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = character.position.y
	position.x = character.position.x

func _input(event : InputEvent):
	if event is InputEventMouseMotion :
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			rotate_x(deg_to_rad(changev))
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#for (int i = 0; i<nb_ray)
		var camera = $Camera
		var from = project_ray_origin(event.position)
		var to = from + project_ray_normal(event.position) * ray_length
		
		print(position, from, to)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func send_ray():
	pass
