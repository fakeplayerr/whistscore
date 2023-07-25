extends Node
class_name GameManager

@export_category("Games")
var next_scene = preload("res://scenes/game.tscn")
#
func _ready() -> void:
	pass
	
#
#func set_current_game(game):
#	current_game = game
#	remove_child(get_children()[0])
#	add_child(game)
func _process(delta: float) -> void:
	pass
#	$VBoxContainer/Label.text = config.name

func _on_save_pressed() -> void:
	pass
#	config.save_config()
	


func _on_load_pressed() -> void:
	pass
#	config.load_config()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(next_scene)
