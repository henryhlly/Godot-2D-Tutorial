extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("Key_Quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("Key_Reset"):
		get_tree().reload_current_scene()
