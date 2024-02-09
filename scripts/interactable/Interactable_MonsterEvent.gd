extends Node

class_name Interactable_MonsterEvent

@export var prompt_message = "Interact"

func get_interaction_text():
	return "Interact"
func interact():
	print("Interacted with %s" % name)
	
func get_prompt():
	return prompt_message
