extends Node

func test_game():
	var game_data = preload("res://tests/game_data.gd").new()
	game_data.set_value("score:", 100)
	var score = game_data.get_value("score")
	assert(score == 100, "Score test failed!")
	
	var default_value = game_data.get_value("no key", "default")
	assert(default_value == "default", "Default value test failed!")
