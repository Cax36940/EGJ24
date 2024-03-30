class_name Npc
extends StaticBody3D

var is_interacting = false
var highlight_trace = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#OUTLINE ???
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func engage(character : CharacterBody3D):
	print(global_position, character.global_position)
	var angle : float = Vector2(global_position.x,global_position.z).angle_to(Vector2(character.global_position.x, character.global_position.z))
	rotation.y = deg_to_rad(angle)
	#print(rad_to_deg(angle))#NPC rotate to player, NPC does something ??
	#rotate_y(character.global_position)

func disengage(character : CharacterBody3D):
	#NPC rotate to player, NPC does something ??
	#rotate_y(character.global_position)
	pass
