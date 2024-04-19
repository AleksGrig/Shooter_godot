extends KinematicBody2D


# Declare member variables here. Examples:
var can_laser: bool = true
var can_grenade: bool = true
signal laser
signal grenade


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction: Vector2 = Input.get_vector("left_move", "right_move", "up_move", "down_move")
	var velocity: Vector2 = direction * 200
	var _res = move_and_slide(velocity)

	if Input.is_action_pressed("laser") and can_laser:
		emit_signal("laser")
		can_laser = false
		$LaserTimer.start()
	elif Input.is_action_pressed("grenade") and can_grenade:
		emit_signal("grenade")
		can_grenade = false
		$GrenadeTimer.start()


func _on_LaserTimer_timeout():
	can_laser = true


func _on_GrenadeTimer_timeout():
	can_grenade = true