extends Node3D


func _ready():
	
	var audio_player = $Sound/AudioStreamPlayer3D
	
	audio_player.play()
