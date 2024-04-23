extends KinematicBody2D


# Declare member variables here.
var can_laser: bool = true
var can_grenade: bool = true
signal laser(pos)
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
		# randomly select Position2D for the laser start
		var laser_markers: Array = $LaserStartPositions.get_children()
		var selected_laser: Node = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		# emit the position we selected
		emit_signal("laser", selected_laser.global_position)
	elif Input.is_action_pressed("grenade") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		emit_signal("grenade", pos)


func _on_LaserTimer_timeout():
	can_laser = true


func _on_GrenadeTimer_timeout():
	can_grenade = true
