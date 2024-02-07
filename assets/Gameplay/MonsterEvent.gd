extends Area3D

class_name Monster_Event

@export var triggered = false

func _on_body_entered(body):
	if body.name == "Player":
		triggered = true
		print("collision")
	
func mainlevelconfirm():
	$CollisionShape3D.disabled = true
	
func _on_body_exited(body):
	triggered = false
	print("exited")
