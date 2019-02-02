extends Control

func _ready():
	$VBoxContainer/HiScore.text = "High Score: " + str(Global.hi_score)
	$VBoxContainer/Score.text = "Your Score: " + str(Global.score)

func _on_Start_pressed():
	Global.start_game()
	get_tree().change_scene("res://Main.tscn")
