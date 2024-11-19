extends Sprite2D
class_name PaperToy

var cell : Vector2i
@onready var rot : int = int(round(rotation*2/PI))
func _physics_process(_delta: float) -> void:
	rot=posmod(rot,4)
	var rotation2 = rot*PI*0.5
	var to_rotation2 = rotation2-rotation
	if to_rotation2 < -PI: to_rotation2 += PI + PI
	if to_rotation2 > PI: to_rotation2 -= PI + PI
	rotation += to_rotation2 * 0.5
	
	cell = Vector2i(
		int(round((position.x-5)*0.1)),
		int(round((position.y-5)*0.1))
	)
	var snappedpos : Vector2 = Vector2(
		cell.x*10+5,
		cell.y*10+5
	)
	position = lerp(position,snappedpos,0.25)
