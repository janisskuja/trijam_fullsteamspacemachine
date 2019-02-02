extends Node

var hi_score = 0
var score = 0
var hp = 3

func set_score():
	if(hi_score < score):
		hi_score = score

func start_game():
	score = 0
	hp = 3