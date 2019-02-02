extends Area2D

export (float) var speed = 20
export (bool) var is_right = true

func _process(delta):
	if is_right:
		position.x += 1 * speed
	else:
		position.x -= 1 * speed

func _on_Bullet_area_entered(area):
	queue_free()
