extends Node

@onready var monster_event01 = get_node("/root/MainLevel/Gameplay/MonsterEvent01/MonsterEvent")
@onready var monster_event02 = get_node("/root/MainLevel/Gameplay/MonsterEvent02/MonsterEvent")
@onready var monster_event03 = get_node("/root/MainLevel/Gameplay/MonsterEvent03/MonsterEvent")
@onready var end_game = get_node("/root/MainLevel/Gameplay/EndGame/MonsterEvent")
@onready var event_number = 1
@onready var blackscreen = get_node("BlackScreen")
@onready var mainlevel = get_node("MainLevel")

@onready var music_fader = $Sound/MonsterMusic_FadeIn
var fade_duration := 2.00
var fade_type := 1

signal camera_switch_01

func _ready():
	
	var show_event01 = $MonsterEvent01
	var show_event02 = $MonsterEvent02
	var show_event03 = $MonsterEvent03
	var show_endgame = $EndGame
	
	# setting basic visibility of monster events
	show_event01.set_visible(true)
	show_event02.set_visible(false)
	show_event03.set_visible(false)
	show_endgame.set_visible(false)
	
func _process(delta):
	check_if_monsterevent_triggered()
	
#region Monster Event Sequence Logic
func check_if_monsterevent_triggered():
	
	var event_triggered01 = monster_event01.get("triggered")
	var event_triggered02 = monster_event02.get("triggered")
	var event_triggered03 = monster_event03.get("triggered")
	var event_triggered04 = end_game.get("triggered")
	
# check if monster event is overlapped by player and run appropriate script
	if event_triggered01 == true and event_number == 1:
		MonsterEvent01Called()
		return
	
	elif event_triggered02 == true and event_number == 2:
		MonsterEvent02Called()
		return
		
	elif event_triggered03 == true and event_number == 3:
		MonsterEvent03Called()
		return
		
	elif event_triggered04 == true and event_number == 4:
		MonsterEvent04Called()
		return
	
# Run Monster Event scripts
func MonsterEvent01Called():
	print("setting up monster event 02")
	
	$Sound/MonsterMusic01.play()
	
	$Sound/MonsterMusic02.play()
	$Sound/MonsterMusic02.volume_db = -80
	
	$Sound/MonsterMusic03.play()
	$Sound/MonsterMusic03.volume_db = -80
	
	event_number = 2
	$Gameplay/MonsterEvent01.set_visible(false)
	$Gameplay/MonsterEvent02.set_visible(true)
	monster_event01.mainlevelconfirm()
	
	return
	
func MonsterEvent02Called():
	print("setting up monster event 03")
	
	music_fader.play("MonsterMusic02_FadeIn")
	
	event_number = 3
	$Gameplay/MonsterEvent02.set_visible(false)
	$Gameplay/MonsterEvent03.set_visible(true)
	monster_event02.mainlevelconfirm()
	
	return
	
func MonsterEvent03Called():
	print("setting up END GAME")
	
	music_fader.play("MonsterMusic03_FadeIn")
	
	event_number = 4
	$Gameplay/MonsterEvent03.set_visible(false)
	$Gameplay/EndGame.set_visible(true)
	monster_event03.mainlevelconfirm()
	
	return
	
# End game when last event is run
func MonsterEvent04Called():
#endregion
	get_tree().quit()
	
	return
	
#endregion
	

