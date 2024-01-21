extends CharacterBody3D

var _mouse_sensitivity := 0.3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity
		
		var current_tilt: float = $camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		
		$camera.rotation_degrees.x = clamp(current_tilt, -90, 90)

