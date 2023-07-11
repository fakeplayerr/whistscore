extends Control

signal add_player
@export var player_name: String = ""

@onready var player_name_text = $VBoxContainer/MarginContainer/Label
@onready var line_edit = $VBoxContainer/MarginContainer2/LineEdit

func _ready():
	player_name_text.set_text("")
	line_edit.text = ""
	line_edit.grab_focus()

func _on_line_edit_text_changed(new_text):
	player_name_text.text = new_text


func _on_add_player_button_pressed():
	if player_name_text.text == "":
		line_edit.set_placeholder("Please write a name here!")
		return
	add_player.emit(player_name_text.text)
	queue_free()
	
	


func _on_hidden():
	player_name_text.text = ""
	print("hidden changed")


func _on_back_pressed() -> void:
	queue_free()
