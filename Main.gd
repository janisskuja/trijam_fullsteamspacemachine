extends Node

export (PackedScene) var bullet
export (PackedScene) var enemy

var spawns = []

func _ready():
	spawns = [
		$EnemyBase/Spawn,
		$EnemyBase/Spawn2,
		$EnemyBase/Spawn3,
		$EnemyBase/Spawn4,
		$EnemyBase/Spawn5,
		$EnemyBase/Spawn6
	]

func _process(delta):
	if (Global.hp <= 0):
		get_tree().change_scene("res://GameOver.tscn")
	

func _on_Player_shoot(gun_position):
	var new_bullet = bullet.instance()
	new_bullet.position = $Player.position + gun_position
	$BulletSponge.add_child(new_bullet)


func _on_EnemySpawner_timeout():
	var spawn_index = range(0, 5)[randi() % range(0, 5).size()]
	var current_spawn = spawns[spawn_index]
	var new_enemy = enemy.instance()
	new_enemy.position = current_spawn.position
	$EnemyBase.add_child(new_enemy)
