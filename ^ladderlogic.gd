extends Node

@onready var tiles : TileMap = $"../Tiles"
@onready var toys : Node = $"../Toys"

const EMPTY = Vector2i(0,0)
const LADDER_UP = Vector2i(1,1)

func _physics_process(_delta: float) -> void:
	for tile in tiles.get_used_cells_by_id(0,0,LADDER_UP):
		tiles.set_cell(0,EMPTY)
