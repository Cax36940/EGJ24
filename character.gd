extends CharacterBody3D


const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

func _process(delta) -> void:
	var dirh : int = Input.get_axis("left","right")
	var dirv : int = Input.get_axis("up","down")
	print(dirh)
	if (dirh != 0):
		position.x += dirh*10*delta
	if (dirv != 0):
		position.z += dirv*10*delta
	move_and_slide()
	
