extends RayCast3D

# Verifiy if Raycast is hitting object when pressing the E key

var current_collider

@onready var interaction_label = get_node("/root/MainLevel/UI/Label")
@onready var is_interacting = false
@onready var player = get_node("/root/MainLevel/Player")

func _ready():
	set_interaction_text("")

func _process(_delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and is_interacting == false:
			collider.interact()
			interaction_label.text = ("")
			
			player.lock_controller()
			is_interacting = true
			
		# Remove interaction text and unlock player controller
		elif Input.is_action_just_pressed("Interact") and is_interacting == true:
			interaction_label.text = ("")
			
			player.unlock_controller()
			is_interacting = false
			
	elif current_collider:
		current_collider=null
		set_interaction_text("")
		
func set_interaction_text(text):
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		interaction_label.set_text("Press E to interact")
		interaction_label.set_visible(true)
