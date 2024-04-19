extends Node2D


func _on_Gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)


func _on_Player_laser():
	print("player shoots laser")


func _on_Player_grenade():
	print("player throws grenade")
