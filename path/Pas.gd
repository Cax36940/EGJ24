@tool
extends Path3D


var step_scene : PackedScene = preload("res://path/step.tscn")
const DIST_BETWEEN_STEP : float = 0.75
@export var foot_image : Texture2D
@export var spacing : float = 0.15:
	set(new_value) :
		spacing = new_value
		update_path()

@export var step_number : int = 5 :
	set(new_value) :
		step_number = new_value
		update_path()
@export var show : bool = false :
	set(new_value) :
		show = new_value
		if new_value :
			update_path()
		else :
			for child in get_children():
				child.queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	update_path()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_highlight():
	for child : Node3D in get_children():
		var normal : Sprite3D = child.get_node("StaticBody3D/normal")
		var tween : Tween = create_tween()
		if (normal.modulate.a == 1):
			tween.tween_property(normal, "modulate", Color(Color.WHITE,0.3), 0.1)
		else :
			tween.tween_property(normal, "modulate", Color(Color.WHITE,1), 0.1)


func toggle_visible():
	for child : Node3D in get_children():
		child.toggle_visible()

func update_path():
	for i in range(step_number):
		var step_instance : Node3D = step_scene.instantiate()
		var transform_path : Transform3D = get_curve().sample_baked_with_rotation(float(i)*DIST_BETWEEN_STEP)
		step_instance.position = transform_path.origin + spacing * transform_path.basis.x * (1 if i%2 == 0 else -1)
		step_instance.basis = transform_path.basis
		step_instance.get_node("StaticBody3D/normal").texture = foot_image
		add_child(step_instance)
