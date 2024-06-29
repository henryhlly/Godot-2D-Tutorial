extends CharacterBody2D

signal took_damage

var speed = 300
var rocket_scene = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer # equivalent to get_node("RocketContainer")
@onready var laser_sound = $LaserSound

func _physics_process(_delta):
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
	if Input.is_action_pressed("Down"):
		velocity.y = speed
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	if Input.is_action_pressed("Right"):
		velocity.x = speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(_delta):
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
	rocket_container.add_child(rocket_instance)
	laser_sound.play()
	
func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
