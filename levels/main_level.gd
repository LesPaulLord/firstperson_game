extends Node3D

func _ready():
	$BlackScreen.fade_to_black_done.connect(self.camera_switch_01)
	$BlackScreen.fade_to_black_done.connect($BlackScreen.animationVisible)
	
func camera_switch_01():
	$Camera/Camera_Monster_Event_01.current = true
