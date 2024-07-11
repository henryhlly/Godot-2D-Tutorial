extends Area2D

@onready var animation = $AnimatedSprite2D

func _ready():
	animate()

func animate():
	animation.play("default")
	
