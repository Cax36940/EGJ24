class_name PickUp
extends Node3D

@export var path : String

var start_position
var is_pointing = false
var is_interacting = false

var real_self : Node3D
var outline : MeshInstance3D  
var initial_rotation : Vector3 = rotation

var mouse_sens : float = 0.1

func _ready():
	outline = get_node(path)

func _input(event : InputEvent) -> void:
	if (event is InputEventMouseMotion and is_interacting):
		handle(event)

func handle(event: InputEventMouseMotion) -> void:
		var changeh : int = event.relative.x
		var changev : int = event.relative.y
		rotate_y(deg_to_rad(changeh * mouse_sens))
		rotate_x(deg_to_rad(changev * mouse_sens))

func _process(delta : float) -> void:
	if (is_pointing):
		outline.visible = true
	else :
		outline.visible = false

#func get_object_size() -> Vector3:
	#var global_position = global_transform.origin
	#var object_scale = scale
	## Obtene les dimensions de l'objet (vous pouvez ajuster cela en fonction de votre modèle)
	#var object_dimensions = Vector3(1.0, 1.0, 1.0)
	## Calcule la taille approximative de l'objet en multipliant ses dimensions par son échelle
	#var object_size = object_dimensions * object_scale
	#return object_size
	
func pick_up(character : CharacterBody3D) -> void:
	start_position = self.global_position
	var tween : Tween = create_tween()
	tween.tween_property(self,"global_position",character.get_node("Camera3D/Point").global_position,0.5)
	#var start_position = global_transform.origin
	#var start_rotation = global_transform.basis.get_euler()
	#var center_position = get_viewport().get_visible_rect().size / 2  # Calcule la position du centre de la vue dans le monde
	#var tween : Tween = get_tree().create_tween()
	#
	#tween.tween_property(self,"position",center_position,1)
	#tween.interpolate_method(self, "set_translation", start_position, center_position, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#var target_rotation = (center_position - start_position).angle_to(Vector3.UP)
	#tween.interpolate_callback(self, 1.0, "_rotate_to_target", start_rotation, target_rotation, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#tween.connect("tween_completed", self._on_tween_completed())
	#tween.start()
	#var max_extent = get_object_size()
	#if character != null:
		#var camera = character.get_node("Camera3D")
		#if camera != null:
			#var fov = camera.fov
			#var margin = 1.0  # Valeur de la marge (à ajuster selon vos besoins)
			#var min_distance = (max_extent * margin) / sin(deg_to_rad(fov / 2.0))
			## Modifiez la position de la caméra en conséquence
			#camera.look_at(global_transform.origin, Vector3.UP) 
			#var offset = (camera.global_transform.origin - global_transform.origin).normalized()
			#camera.global_transform.origin = global_transform.origin + (offset * min_distance)

	# Si vous utilisez un Tween, assurez-vous de le configurer et de l'appeler pour démarrer l'animation
	# var tween : Tween = create_tween()
	# tween.tween_property(camera, "translation", newPos.currentPos, lerpSpeed)
	# tween.start()

func put_down(character) -> void:
	var tween = create_tween()
	tween.tween_property(self,"rotation",initial_rotation,0.2)
	tween.tween_property(self,"global_position",start_position,0.5)
