extends Camera3D

@onready var character = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = character.position.y
	position.x = character.position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
