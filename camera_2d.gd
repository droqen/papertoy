extends Camera2D

func _physics_process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_LEFT): rotation -= 0.05
	elif Input.is_key_pressed(KEY_RIGHT): rotation += 0.05
	else: rotation = lerp(rotation,round(rotation/(PI*0.5))*PI*0.5,0.2)
	
	if Input.is_key_pressed(KEY_UP): position += Vector2.UP.rotated(rotation) * 2
	if Input.is_key_pressed(KEY_DOWN): position += Vector2.DOWN.rotated(rotation) * 2
