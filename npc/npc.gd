class_name Npc
extends StaticBody3D

@onready var main_scene : Node3D = get_parent()
var is_pointing = false
var highlight_trace = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func engage(character : CharacterBody3D):
	## Npc se tourne vers le joueur ???
	#var angle : float = Vector2(global_position.x,global_position.z).angle_to(Vector2(character.global_position.x, character.global_position.z))
	#rotation.y = deg_to_rad(angle)
	
	## Informe la scène parent du joueur qui intéragie
	main_scene.idx_current = main_scene.suspects.find(self,0)

func detain():
	get_tree().quit()

func follow():
	main_scene.toggle_follow()

func disengage(character : CharacterBody3D):
	main_scene.idx_current = -1
