extends Node3D

func _ready():
	pass
	
func animationPlay():
	var animation_mixer = get_node("AnimationMixer")
	
	animation_mixer.active()
