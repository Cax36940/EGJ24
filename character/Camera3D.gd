extends Camera3D

@onready var character : CharacterBody3D = get_parent()
var mouse_sens : float = 0.15
var camera_anglev : float = 0 
var ray_length : int = 100
var nb_ray : int = 10

func _ready():
	position.y = character.position.y
	position.x = character.position.x

func _input(event : InputEvent):
	if event is InputEventMouseMotion and character.pause != true:
		var sensitivity = 0.005
		var mouse_velocity = event.relative.x
		character.rotate_y(deg_to_rad(-mouse_velocity * self.mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			rotate_x(deg_to_rad(changev))

func _process(delta):
	pass

func send_ray():
	pass
