extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

var active = true
var direction = 0

func _physics_process(delta):
	if is_on_floor()==false:
		# Gravity
		velocity.y += gravity*delta
		if velocity.y > 500:
			velocity.y = 500
	
	if active:
		if Input.is_action_just_pressed("Key_Jump") && is_on_floor():
			jump(jump_force)
		
		direction = Input.get_axis("Key_Left", "Key_Right")
		if direction != 0:
			animated_sprite.flip_h = (direction == -1)
		velocity.x = direction*speed
	
	move_and_slide()
	update_animation(direction)

func update_animation(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")

func jump(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force
