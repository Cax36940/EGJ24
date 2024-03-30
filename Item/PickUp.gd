class_name PickUp
extends StaticBody3D

var distance_look : Vector3
var character : CharacterBody3D

func ready() -> void:
	pass

func pick_up() -> void:
	if (distance_look.distance_to(character.position)):
		pass

