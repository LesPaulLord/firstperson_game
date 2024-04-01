extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func frontdoor_swap():
	
	$Front_Door_Wall_01.queue_free()
	$Front_Door.queue_free()
	createWall02()
	
func createWall02():
	$Wall_Front_Door_02.set_position(Vector3(-2.4, 0, -0.6))
