extends Node
class_name BaseCharacter
var health = 100

func take_damage(amount):
	health -= amount
	print("Health: ", health)
