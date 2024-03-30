class_name Npc
extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func engage(character : CharacterBody3D):
	var angle : float = global_position.angle_to(character.global_position)
	print(angle)#NPC rotate to player, NPC does something ??
	#rotate_y(character.global_position)
	pass

func disengage(character : CharacterBody3D):
	#NPC rotate to player, NPC does something ??
	#rotate_y(character.global_position)
	pass
