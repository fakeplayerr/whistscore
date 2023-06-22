extends Control

signal add_player
@export var player_name: String = ""

@onready var player_name_text = $VBoxContainer/MarginContainer/Label

func _ready():
	player_name_text.text = ""

func _on_line_edit_text_changed(new_text):
	player_name_text.text = new_text


func _on_add_player_button_pressed():
	add_player.emit(player_name_text.text)


func _on_hidden():
	player_name_text.text = ""
