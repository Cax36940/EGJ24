extends Node

@export var suspects : Array[Npc] = [] 
@export var paths : Array[Node3D] = []
@export var guilty_idx : int
var idx_current : int

func toggle_follow():
	var current_path : Node3D = paths[idx_current]
	current_path.toggle_visible()

func stop_follow():
	for path in paths:
		path.visible = false

func detain():
	if (idx_current == guilty_idx):
		print("You win")
		$AudioStreamPlayer.play()
	else :
		print("You lose")
		$AudioStreamPlayer2.play()
	while( $AudioStreamPlayer.playing or $AudioStreamPlayer2.playing):
		pass
	get_tree().quit()
