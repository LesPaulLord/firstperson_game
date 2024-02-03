extends RayCast3D

# Verifiy if Raycast is hitting object when pressing the E key

var current_collider

@onready var interaction_label = get_node("/root/GymProg01Door/UI/Label")

func _ready():
	set_interaction_text("")

func _process(_delta):
	var collider = get_collider()
	
	if is_colliding() and collider is interactable:
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		if Input.is_action_just_pressed("Interact"):
			set_interaction_text(collider.get_interaction_text())
			collider.interact()
			interaction_label.text = collider.get_prompt()
			
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
