extends Node


func set_label(text):
	$VBoxContainer/Score.text = text

func set_color(color):
	$ColorRect.color = color

func get_color():
	var color_rect = ColorRect.new()
	color_rect.custom_minimum_size = Vector2(100.0,100.0)
	color_rect.color = ColorPicker.new()
	return color_rect


func _on_color_rect_focus_entered() -> void:
	$Tween.play_tween()


func _on_color_rect_gui_input() -> void:
	$Tween.play_tween()
