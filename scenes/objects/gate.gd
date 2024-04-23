extends StaticBody2D


signal player_entered_gate(body)


func _on_Area2D_body_entered(body: Node):
	emit_signal("player_entered_gate", body)
