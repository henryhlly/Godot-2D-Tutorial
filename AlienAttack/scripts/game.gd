extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var game_over_screen = preload("res://scenes/game_over_screen.tscn")
@onready var enemy_hit_sound = $EnemyHitSound
@onready var explosion_sound = $ExplosionSound

func _ready():
	hud.set_score_label(score)
	hud.set_life_label(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	explosion_sound.play()
	lives -= 1
	hud.set_life_label(lives)
	if lives <= 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_screen_instance = game_over_screen.instantiate()
		ui.add_child(game_over_screen_instance)
		game_over_screen_instance.set_score(score)
		
		

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	enemy_hit_sound.play()
	score += 100
	hud.set_score_label(score)
