extends Node

@export var suspects : Array[Npc] = [] 
@export var paths : Array[Node3D] = []
var idx_current : int

func toggle_follow():
	var current_path : Node3D = paths[idx_current]
	if (current_path.visible):
		current_path.visible = false
	else :
		current_path.visible = true

func stop_follow():
	for path in paths:
		path.visible = false
