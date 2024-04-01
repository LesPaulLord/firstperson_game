extends Node3D

func _ready():
	
	var dot_UI = $UI/Dot_Reticle
	
	# Monster_Event 01 sequence signal activations
	
	# First Fade to Black
	$Player/rotation_helper/Camera3D/interaction_raycast.start_MonsterEvent_01.connect($BlackScreen.animationBlack)
	
	# Camera switch and animation start
	$BlackScreen.fade_to_black_done.connect(self.camera_switch_01)
	$BlackScreen.fade_to_black_done.connect(dot_UI.hide)
	$BlackScreen.fade_to_black_done.connect($BlackScreen.animationVisible)
	$BlackScreen.fade_to_black_done.connect($Gameplay/Monster_01_Rigged.animationPlay)
	$BlackScreen.fade_to_black_done.connect($Gameplay/MonsterEvent01_SFX.play)
	$BlackScreen.fade_to_black_done.connect($Sound/SFX_Inspiration_Guide_01.stop)
	
	# Fade to Visible
	$BlackScreen.fade_to_visible_done.connect($Player/rotation_helper/Camera3D/interaction_raycast.monster_event_is_true)
	
	# MonsterEvent01 animation is skipped, or over
	$Player/rotation_helper/Camera3D/interaction_raycast.end_MonsterEvent_01.connect($BlackScreen.animationBlack)
	$Gameplay/Monster_01_Rigged.end_MonsterEvent_01.connect($BlackScreen.animationBlack)
	
	# Switch back to player camera
	$BlackScreen.fade_to_black_done_02.connect(self.camera_switch_02)
	$BlackScreen.fade_to_black_done_02.connect(dot_UI.show)
	$BlackScreen.fade_to_black_done_02.connect($BlackScreen.animationVisible)
	$BlackScreen.fade_to_black_done_02.connect($Sound/Monster_01_Ambient.play)
	$BlackScreen.fade_to_black_done_02.connect($Enviro_Meshes/Env.frontdoor_swap)
	
	# Controller unlocked
	$BlackScreen.fade_to_visible_done_02.connect($Player/rotation_helper/Camera3D/interaction_raycast.monster_event_is_false)
	$BlackScreen.fade_to_visible_done_02.connect($Player.unlock_controller)
	
func camera_switch_01():
	$Camera/Camera_Monster_Event_01.current = true
	
func camera_switch_02():
	$Player/rotation_helper/Camera3D.current = true
