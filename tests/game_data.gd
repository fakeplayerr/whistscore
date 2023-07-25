extends Node
class_name GameData

var data = {}

func set_value(key, value):
	data[key] = value

func get_value(key, default_value = null):
	if key in data:
		return data[key]
	return default_value
