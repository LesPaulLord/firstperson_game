extends RayCast3D

# Verifiy if Raycast is hitting object when pressing the E key

var current_collider

@onready var interaction_eye = get_node("/root/MainLevel/UI/Eye_Reticle")
@onready var interaction_text = get_node("/root/MainLevel/UI/InteractionText")

@onready var is_interacting = false
@onready var monsterevent_is_current = false
@onready var monsterevent_01_ready = false
@onready var monsterevent_01_done = false
@onready var door_front_interacted = false
@onready var door_is_open = false

@onready var player = get_node("/root/MainLevel/Player")
@onready var playerUI = get_node("/root/MainLevel/UI")

@onready var door = get_tree().current_scene.get_node("Gameplay/Door_interactable")

@onready var music = get_tree().current_scene.get_node("Sound")

signal start_MonsterEvent_01
signal end_MonsterEvent_01

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
			interaction_text.show()
			interaction_eye.set_visible(false)
			set_interaction_text(collider.get_interaction_text())
			collider.interact()
			interaction_text.text = collider.get_prompt()
			
			player.lock_controller()
			is_interacting = true
			
		# Remove interaction text and unlock player controller
		elif Input.is_action_just_pressed("Interact") and is_interacting == true:
			interaction_text.hide()
			interaction_text.text = ("")
			
			player.unlock_controller()
			is_interacting = false
			
	elif is_colliding() and collider is Interactable_MonsterEvent:
		if current_collider != collider and monsterevent_01_done == false and monsterevent_01_ready == true:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and monsterevent_01_ready == true and is_interacting == false and monsterevent_is_current == false and monsterevent_01_done == false:
			interaction_eye.set_visible(false)
			interaction_text.hide()
			collider.interact()
			interaction_text.text = ("")
			
			player.lock_controller()
			is_interacting = true
			
			emit_signal("start_MonsterEvent_01")
			
			monsterevent_01_done = true
			
		elif current_collider != collider and monsterevent_01_done == true:
			return
			
			#Possibility of skipping cutscene has been cut for now
		#elif Input.is_action_just_pressed("Interact") and is_interacting == true and monsterevent_is_current == true:
			#emit_signal("end_MonsterEvent_01")
			#monsterevent_is_current = false
			#is_interacting = false
			#monsterevent_01_done = true
			
	elif is_colliding() and collider is Interactable_Door_Front:
		
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and door_front_interacted == false and is_interacting == false:
			interaction_text.show()
			interaction_eye.set_visible(false)
			collider.interact()
			interaction_text.text = collider.get_prompt()
			
			player.lock_controller()
			is_interacting = true
			
			monsterevent_01_ready = true
			
		elif Input.is_action_just_pressed("Interact") and door_front_interacted == true and is_interacting == false:
			interaction_text.show()
			interaction_eye.set_visible(false)
			collider.interact()
			interaction_text.text = collider.get_prompt()
			
			player.lock_controller()
			is_interacting = true
			
		elif Input.is_action_just_pressed("Interact") and door_front_interacted == false and is_interacting == true:
			interaction_text.hide()
			collider.interact()
			interaction_text.text = ("")
			
			music.play_inspiration_Music_01()
			
			door_front_interacted = true
			player.unlock_controller()
			is_interacting = false
			
		elif Input.is_action_just_pressed("Interact") and door_front_interacted == true and is_interacting == true:
			interaction_text.hide()
			collider.interact()
			interaction_text.text = ("")
			
			player.unlock_controller()
			is_interacting = false
			
	elif is_colliding() and collider is Interactable_Door_Open:
		
		if current_collider != collider and door_is_open == false:
			interaction_text.show()
			interaction_eye.set_visible(false)
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
			
		elif current_collider != collider and door_is_open == true:
			interaction_text.hide()
			interaction_text.text = ("")
			
		# Set the interaction text and lock player controller
		if Input.is_action_just_pressed("Interact") and door_is_open == false:
			interaction_text.hide()
			collider.interact()
			door.animation()
			door_is_open = true
			interaction_text.text = ("")
			
		# Remove interaction text and unlock player controller
		elif Input.is_action_just_pressed("Interact") and door_is_open == true:
			interaction_text.hide()
			interaction_text.text = ("")
			
	elif current_collider:
		current_collider=null
		set_interaction_text("")
#endregion
		
func set_interaction_text(text):
	
	if !text:
		interaction_eye.set_visible(false)
		
	else:
		interaction_eye.set_visible(true)
		
func monster_event_is_true():
	monsterevent_is_current = true
	
func monster_event_is_false():
	monsterevent_is_current = false

