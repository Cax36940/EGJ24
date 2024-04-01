extends Node

@export var suspects : Array[Npc] = [] 
@export var paths : Array[Node3D] = []
var idx_current : int

func toggle_follow():
	var current_path : Node3D = paths[idx_current]
	current_path.toggle_visible()

func stop_follow():
	for path in paths:
		path.visible = false
