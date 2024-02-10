extends Control

signal fade_to_black_done
signal fade_to_visible_done
signal fade_to_black_done_02
signal fade_to_visible_done_02

var animation_counter = 0

func animationBlack():
	$AnimationPlayer.play("Fade_to_Black")
	print("animation_black_is_playing")
	
func animationVisible():
	$AnimationPlayer.play("Fade_to_Visible")

func _on_animation_player_animation_finished(Fade_to_Black):
	
	if animation_counter == 0:
		emit_signal("fade_to_black_done")
		animation_counter = 1
	
	elif animation_counter == 1:
		emit_signal("fade_to_visible_done")
		animation_counter = 2
		
	elif animation_counter == 2:
		emit_signal("fade_to_black_done_02")
		animation_counter = 3
	
	elif animation_counter == 3:
		emit_signal("fade_to_visible_done_02")
		animation_counter = 0

