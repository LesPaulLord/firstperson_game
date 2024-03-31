extends Node3D

@onready var at = $AnimationTree
@onready var cutscenePlayer = $AnimationPlayerCutscene

signal end_MonsterEvent_01

func _ready():
	var at_mixer = at.get("active")
	at_mixer = false

func _process(_delta):
	pass

func animationPlay():
	cutscenePlayer.play("MainSequence")
	
func _on_animation_player_cutscene_animation_finished(Main_Sequence):
	emit_signal("end_MonsterEvent_01")
