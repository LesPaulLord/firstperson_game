extends RayCast3D

# Verifiy if Raycast is hitting object when pressing the E key

var current_collider

@onready var interaction_label = get_node("/root/MainLevel/UI/Label")
@onready var is_interacting = false
@onready var door_is_open = false
@onready var player = get_node("/root/MainLevel/Player")
@onready var door = get_tree().current_scene.get_node("Gameplay/Door_interactable")
@onready var fadetoblack = get_tree().current_scene.get_node("BlackScreen")

func _ready():
	set_interaction_text("")

func _process(_delta):
	
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable_Item:
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and is_interacting == false:
			set_interaction_text(collider.get_interaction_text())
			collider.interact()
			interaction_label.text = collider.get_prompt()
			
			player.lock_controller()
			is_interacting = true
			
		# Remove interaction text and unlock player controller
		elif Input.is_action_just_pressed("Interact") and is_interacting == true:
			interaction_label.text = ("")
			
			player.unlock_controller()
			is_interacting = false
			
	elif is_colliding() and collider is Interactable_MonsterEvent:
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and is_interacting == false:
			collider.interact()
			interaction_label.text = ("")
			
			player.lock_controller()
			is_interacting = true
			
			fadetoblack.animationBlack()
			
		
	elif is_colliding() and collider is Interactable_Door:
		
		if current_collider != collider and door_is_open == false:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		elif current_collider != collider and door_is_open == true:
			interaction_label.text = ("")
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and door_is_open == false:
			collider.interact()
			door.animation()
			door_is_open = true
			interaction_label.text = ("")
			
		# Remove interaction text and unlock player controller
		elif Input.is_action_just_pressed("Interact") and door_is_open == true:
			interaction_label.text = ("")
			
	elif current_collider:
		current_collider=null
		set_interaction_text("")
#endregion
		
func set_interaction_text(text):
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		interaction_label.set_text("Press E to interact")
		interaction_label.set_visible(true)

