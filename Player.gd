extends Area2D

export (Vector2) var screenSize = Vector2(1024, 600)
export (float) var speed = 10

signal shoot

func _process(delta):
	check_movement()
	check_shoot()

func check_movement():
	if Input.is_action_pressed("ui_right") && position.x < screenSize.x:
		position.x += 1 * speed
	if Input.is_action_pressed("ui_left") && position.x > 0:
		position.x -= 1 * speed
	if Input.is_action_pressed("ui_up") && position.y > 0:
		position.y -= 1 * speed
	if Input.is_action_pressed("ui_down") && position.y < screenSize.y:
		position.y += 1 * speed

func check_shoot():
	if Input.is_action_just_pressed("ui_select"):
		emit_signal("shoot", $Gun.position)

func _on_Player_area_entered(area):
	if area.is_in_group("bullet") || area.is_in_group("enemy"):
		Global.hp -= 1
