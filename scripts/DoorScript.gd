extends Node3D

func _on_area_3d_area_entered(area):
	$AnimationPlayer.play("Open")
