extends Node

var monsterMusic01 = load("res://sound/Monster_Theme_001_Bass.mp3")
var monsterMusic02 = load("res://sound/Monster_Theme_001_Drums.mp3")
var monsterMusic03 = load("res://sound/Monster_Theme_001_Keys.mp3")

func _ready():
	pass

func play_monsterMusic():
	
	print("music works")
	$MonsterMusic01.stream = monsterMusic01
	$MonsterMusic01.play()
	
