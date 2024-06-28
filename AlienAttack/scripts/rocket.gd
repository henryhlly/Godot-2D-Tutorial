extends Area2D

@export var speed = 300
@onready var visible_notifier = $VisibleOnScreenNotifier2D

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Account for different frame rates. Currently running at 60fps
	global_position.x += speed*delta

func _on_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
