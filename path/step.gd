extends Node3D

@onready var parent = get_parent().get_parent()

func _ready():
	if (parent.visible):
		$StaticBody3D.set_collision_layer_value(6, true)
	else :
		$StaticBody3D.set_collision_layer_value(6, false)

func toggle_visible():
	if ($StaticBody3D.get_collision_layer_value(6)) :
		$StaticBody3D.set_collision_layer_value(6, false)
	else :
		$StaticBody3D.set_collision_layer_value(6, true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
