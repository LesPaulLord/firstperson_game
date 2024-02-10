extends Control

signal fade_to_black_done

func animationBlack():
	$AnimationPlayer.play("Fade_to_Black")
	print("animation_black_is_playing")
	
func animationVisible():
	$AnimationPlayer.play("Fade_to_Visible")

func _on_animation_player_animation_finished(Fade_to_Black):
	emit_signal("fade_to_black_done")
	print("animation_done")
