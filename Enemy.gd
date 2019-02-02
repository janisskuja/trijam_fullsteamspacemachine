extends Area2D

export (Vector2) var screenSize = Vector2(1024, 600)
export (float) var speed = 5
export (PackedScene) var bullet

var movements = [
 "up",
 "down",
 "left"
]
var current_movement = "left"

signal shoot

func _ready():
	speed = range(5, 10)[randi() % range(5, 10).size()]

func _process(delta):
	check_movement()

func change_movement():
	var movement_index = range(0, 2)[randi() % range(0, 2).size()]
	current_movement = movements[movement_index] 
	
func check_movement():
	if position.x < 0:
		queue_free()
	if current_movement == "left":
		position.x -= 1 * speed
	if current_movement == "up" && position.y > 0:
		position.y -= 1 * speed
	if current_movement == "down" && position.y < screenSize.y:
		position.y += 1 * speed

func _on_ChangeMovementTimer_timeout():
	change_movement()
	emit_signal("shoot", $Gun.position)


func _on_Enemy_area_entered(area):
	if area.is_in_group("bullet"):
		Global.score += 1
		queue_free()


func _on_Enemy_shoot(gun_position):
	var new_bullet = bullet.instance()
	new_bullet.is_right = false
	new_bullet.position = $Gun.position
	$BulletSponge.add_child(new_bullet)
