extends Node3D

@onready var monster_event = get_node("MonsterEvent01/MonsterEvent")

func _ready():
	
	# start music
	var audio_player = $Sound/AudioStreamPlayer3D
	# (To reactivate for music on) audio_player.play()
	
	var event_triggered = monster_event.get("triggered")
	
	var show_event01 = $MonsterEvent01
	var show_event02 = $MonsterEvent02
	var show_event03 = $MonsterEvent03
	
	# setting basic visibility of monster events
	show_event01.set_visible(true)
	show_event02.set_visible(false)
	show_event03.set_visible(false)
	
func _process(delta):
	
	var event_triggered = monster_event.get("triggered")
	
# check if monster event is overlapped by player and run appropriate script
	if event_triggered == true:
		MonsterEvent01Called()
		return
	
# Run first Monster Event script

func MonsterEvent01Called():

	print("setting up monster event 02")
	$MonsterEvent01.set_visible(false)
	$MonsterEvent02.set_visible(true)
	monster_event.mainlevelconfirm()
	
	set_process(false)
	
# Run second Monster Event script
func MonsterEvent02Called():
	print("setting up monster event 03")
	$MonsterEvent02.set_visible(false)
	$MonsterEvent03.set_visible(true)
	
	set_process(false)

