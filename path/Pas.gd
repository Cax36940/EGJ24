@tool
extends Path3D


var step_scene : PackedScene = preload("res://path/step.tscn")
const DIST_BETWEEN_STEP : float = 0.75

@export var step_number : int = 5 :
	set(new_value) :
		show = false
		step_number = new_value
		show = true
@export var show : bool = false :
	set(new_value) :
		show = new_value
		if new_value :
			for i in range(step_number):
				var step_instance : Node3D = step_scene.instantiate()
				var transform_path : Transform3D = get_curve().sample_baked_with_rotation(float(i)*DIST_BETWEEN_STEP)
				step_instance.position = transform_path.origin + 0.5 * transform_path.basis.x * (1 if i%2 == 0 else -1)
				step_instance.basis = transform_path.basis
				add_child(step_instance)
		else :
			for child in get_children():
				child.queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
