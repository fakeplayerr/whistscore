extends Node
class_name TweenEffect

@export var current_node: Control
@export var from: int = 0
@export var to: int = 0
@onready var revertPosition = false
@onready var currentPosition : Vector2 = Vector2(0,0)

func play_tween():
	print("REVERT: ", revertPosition)
	currentPosition = current_node.position
	if !revertPosition:
		var new_tween = current_node.get_tree().create_tween()
		new_tween.tween_property(current_node, "position", Vector2(from,to), 1)		
		revertPosition = true
		return
	else:
		var new_tween = current_node.get_tree().create_tween()
		new_tween.tween_property(current_node, "position", currentPosition, 1)
		revertPosition = false
		return
#	for sprite in tween.get_children():
#		tween.tween_property(sprite, "position", Vector2(0, 0), 1)
