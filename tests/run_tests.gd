extends Node

func _ready():
	var test_resource = preload("res://tests/test_main.gd").new()
	test_resource.test_game()
