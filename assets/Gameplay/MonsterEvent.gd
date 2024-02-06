extends Area3D

class_name Monster_Event

@export var triggered = false

func _on_body_entered(body):
	triggered = true
	print("collision")
	
func mainlevelconfirm():
	triggered = false
	print("bitchass")
