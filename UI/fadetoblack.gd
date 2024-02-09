extends Control

signal fade_to_black_done

func animationBlack():
	$AnimationPlayer.play("Fade_to_Black")
	
func animationVisible():
	$AnimationPlayer.play("Fade_to_Visible")

func _on_animation_player_animation_finished(Fade_to_Black):
	fade_to_black_done.emit()
	print("animation_done")
