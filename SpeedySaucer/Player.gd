extends RigidBody2D

var force = 1000
	
func _physics_process(delta):
	var force = 1000
	if Input.is_action_pressed("Up"):
		apply_force(Vector2(0,-force))
	if Input.is_action_pressed("Down"):
		apply_force(Vector2(0,force))
	if Input.is_action_pressed("Left"):
		apply_force(Vector2(-force,0))
	if Input.is_action_pressed("Right"):
		apply_force(Vector2(force,0))
