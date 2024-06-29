extends Control

@onready var score = $Score
@onready var lives = $Lives

func set_score_label(new_score):
	score.text = "SCORE: " + str(new_score)

func set_life_label(new_lives):
	lives.text = str(new_lives)
