extends Node

const DOOR_PREFAB = preload("res://toy_is_door.tscn")
func _ready() -> void:
	var toys : Node = $"../Toys"
	var tiles : TileMapLayer = $"../Tiles"
	for cell in tiles.get_used_cells_by_id(0,Vector2i(1,2)):
		tiles.set_cell(cell, 0, Vector2i(3,2))
	for cell in tiles.get_used_cells_by_id(0,Vector2i(3,2)):
		var door = DOOR_PREFAB.instantiate()
		toys.add_child(door)
		door.position = tiles.map_to_local(cell) 
