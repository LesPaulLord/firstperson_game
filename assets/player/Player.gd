extends CharacterBody3D

const ACCEL = 10
const DEACCEL = 30

const SPEED_DEFAULT = 3.0
var SPEED = SPEED_DEFAULT

var controller_locked = false

const MOUSE_SENSITIVITY = 0.06

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var camera
var rotation_helper
var dir = Vector3.ZERO

func _ready():
	camera = $rotation_helper/Camera3D
	rotation_helper = $rotation_helper
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	# This section controls your player camera. Sensitivity can be changed.
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and controller_locked == false:
		rotation_helper.rotate_x(deg_to_rad(event.relative.y * MOUSE_SENSITIVITY * -2))
		self.rotate_y(deg_to_rad(event.relative.x * MOUSE_SENSITIVITY * -2))

		var camera_rot = rotation_helper.rotation
		camera_rot.x = clampf(camera_rot.x, -1.4, 1.4)
		rotation_helper.rotation = camera_rot
		
	elif event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and controller_locked == true:
		
		var mousemotion = InputEventMouseMotion
		mousemotion = Vector2(0, 0)
		
func _physics_process(delta):
	
	# Add the gravity. Pulls value from project settings.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# This just controls acceleration. Don't touch it.
	var accel
	
	if dir.dot(velocity) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL
		
	# Debug cheat for going fast !!
	if SPEED == 3.0 and Input.is_action_just_pressed("Sprint"):
			SPEED = 12.0
			
	elif SPEED == 12.0 and Input.is_action_just_pressed("Sprint"):
			SPEED = 3.0
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with a custom keymap depending on your control scheme. These strings default to the arrow keys layout.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() * accel * delta

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	if controller_locked == false and Input.is_action_just_pressed("Test_Controller_Lock"):
		SPEED = 0
		controller_locked = true
		
	elif controller_locked == true and Input.is_action_just_pressed("Test_Controller_Lock"):
		SPEED = SPEED_DEFAULT
		controller_locked = false

func lock_controller():
		SPEED = 0
		controller_locked = true
		
func unlock_controller():
		SPEED = SPEED_DEFAULT
		controller_locked = false
