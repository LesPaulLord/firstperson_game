extends Node3D

func _ready():
	
	# Monster_Event 01 sequence signal activations
	$Player/rotation_helper/Camera3D/interaction_raycast.start_MonsterEvent_01.connect($BlackScreen.animationBlack)
	
	$BlackScreen.fade_to_black_done.connect(self.camera_switch_01)
	$BlackScreen.fade_to_black_done.connect($BlackScreen.animationVisible)
	
	$BlackScreen.fade_to_visible_done.connect($Player/rotation_helper/Camera3D/interaction_raycast.monster_event_is_true)
	
	$Player/rotation_helper/Camera3D/interaction_raycast.end_MonsterEvent_01.connect($BlackScreen.animationBlack)
	
	$BlackScreen.fade_to_black_done_02.connect(self.camera_switch_02)
	$BlackScreen.fade_to_black_done_02.connect($BlackScreen.animationVisible)
	
	$BlackScreen.fade_to_visible_done_02.connect($Player/rotation_helper/Camera3D/interaction_raycast.monster_event_is_false)
	$BlackScreen.fade_to_visible_done_02.connect($Player.unlock_controller)
	
func camera_switch_01():
	$Camera/Camera_Monster_Event_01.current = true
	
func camera_switch_02():
	$Player/rotation_helper/Camera3D.current = true
