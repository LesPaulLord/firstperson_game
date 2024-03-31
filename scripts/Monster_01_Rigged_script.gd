extends Node3D

@onready var at = $AnimationTree
@onready var cutscenePlayer = $AnimationPlayerCutscene

signal end_MonsterEvent_01

func _process(_delta):
	pass

func animationPlay():
	var ap = get_node("AnimationTree")
	ap.set("active", true)
	hold_for_animation()
	
func hold_for_animation():
	await get_tree().create_timer(27.0).timeout
	monster_anim_over()
	
func monster_anim_over():
	emit_signal("end_MonsterEvent_01")
