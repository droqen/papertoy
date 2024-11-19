extends Node2D

@onready var parentpos : Vector2 = get_parent().position

var curreach : int = 0

func _physics_process(_delta: float) -> void:
	if parentpos != get_parent().position:
		curreach -= int(abs(parentpos.distance_to(get_parent().position)))
		parentpos = get_parent().position
		if curreach < 0: curreach = 0
	
	var reach : int = int($ray.target_position.length())
	if $ray.is_colliding(): reach = int($ray.get_collision_point().distance_to(global_position))
	if reach > curreach: curreach += 1
	if reach < curreach: curreach = reach
	
	$TextureRect.size.y = curreach
