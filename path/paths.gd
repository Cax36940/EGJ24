extends Node3D

var highlighted : bool = false

func toggle_highlight() -> void:
	if (highlighted):
		highlighted = false
	else : 
		highlighted = true
	for child : Path3D in get_children():
		child.toggle_highlight()

func toggle_visible() -> void :
	if (visible):
		visible = false
	else :
		visible = true
	for child : Path3D in get_children():
		child.toggle_visible()
