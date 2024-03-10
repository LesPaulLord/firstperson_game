extends Control

@onready var eye_UI = $UI/Eye_Reticle
@onready var dot_UI = $UI/Dot_Reticle

func looking_at_interactable() :
	eye_UI.show()
	dot_UI.hide()
	print("eyeshouldwork")
	
func notlooking_at_interactable() :
	eye_UI.hide()
	dot_UI.show()
