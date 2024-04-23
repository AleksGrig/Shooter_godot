extends Node2D


var laser_scene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene = preload("res://scenes/projectiles/grenade.tscn")


func _on_Gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)


func _on_Player_laser(pos):
	var laser = laser_scene.instance()
	# 1. update laser position
	laser.position = pos
	# 2. we have to move laser
	# 3. add laser instance to a Node2D Projectiles
	$Projectiles.add_child(laser)


func _on_Player_grenade(pos):
	var grenade = grenade_scene.instance()
	grenade.position = pos
	$Projectiles.add_child(grenade)
