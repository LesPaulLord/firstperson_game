extends Area3D


func _ready():
	pass

func _on_body_entered(body):
	print("collision")
	queue_free()
