extends Node

@export var suspects : Array[Npc] = [] 
@export var paths : Array[Node3D] = []

var detain : Button
var follow : Button
var idx_current : int

func _ready():
	detain = get_node("character/UI/Control/MarginContainer/HBoxContainer/VBoxContainer/Detain")
	follow = get_node("character/UI/Control/MarginContainer2/HBoxContainer/VBoxContainer/Follow")

func toggle_follow():
	var current_path : Path3D = paths[idx_current]
	print(current_path.name)
	if (current_path.visible):
		current_path.visible = false
	else :
		current_path.visible = true

func stop_follow():
	for path in paths:
		path.visible = false
