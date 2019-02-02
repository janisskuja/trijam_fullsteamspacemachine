extends Control

func _process(delta):
	$HBoxContainer/Score.text = "Score: " + str(Global.score)
	$HBoxContainer/HP.text = "HP: " + str(Global.hp)
