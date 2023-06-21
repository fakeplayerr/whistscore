extends Node
class_name Settings

@onready var max_players: int = 6
@onready var min_players: int = 3
@onready var number_of_players: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func log():
	print("Settings: ", max_players, min_players, number_of_players)
