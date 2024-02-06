extends Node3D

func _ready():
	
	# start music
	var audio_player = $Sound/AudioStreamPlayer3D
	# (To reactivate for music on) audio_player.play()
	
	var show_event01 = $MonsterEvent01
	var show_event02 = $MonsterEvent02
	
	# setting basic visibility of monster events
	show_event01.set_visible(true)
	show_event02.set_visible(false)
	
func _process(delta):
	
	var event01_done = is_instance_valid($MonsterEvent01)
	
	if event01_done == false:
		print("monsterevent2tospawn")
		$MonsterEvent02.set_visible(true)

