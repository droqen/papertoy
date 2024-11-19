extends Node2D
class_name PaperTable

var mouseUp : bool = true;
var draggingToy : PaperToy

func _physics_process(_delta: float) -> void:
	var mpos = get_global_mouse_position()
	var mclicked = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if mouseUp: mclicked = true
		mouseUp = false
	else:
		mouseUp = true
	$MouseTest.position = mpos
	
	if draggingToy != null:
		if mouseUp:
			draggingToy = null
		else:
			draggingToy.position = lerp(draggingToy.position, mpos, 0.5)
			$ToyCursor.position = draggingToy.position
			$ToyCursor/select.show()
			if Input.is_action_just_pressed("rot_left"):
				draggingToy.rot -= 1
			if Input.is_action_just_pressed("rot_right"):
				draggingToy.rot += 1
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		var hoveredToy : PaperToy = null
		for area in $MouseTest.get_overlapping_areas():
			hoveredToy = area.get_parent() as PaperToy
		if hoveredToy:
			$ToyCursor.show()
			$ToyCursor/select.hide()
			$ToyCursor.position = hoveredToy.position
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
			if mclicked:
				draggingToy = hoveredToy
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
			if Input.is_action_just_pressed("rot_left"):
				hoveredToy.rot -= 1
			if Input.is_action_just_pressed("rot_right"):
				hoveredToy.rot += 1
		else:
			$ToyCursor.hide()
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
