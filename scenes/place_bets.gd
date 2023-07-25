extends Control

@onready var bet_list = []
@export var number_of_hands = 3

@onready var item_list = $VBoxContainer/MarginContainer2/BetList
@onready var bet_button_ui = preload("res://UI/bet_button_ui.tscn")
@onready var upper_container = $VBoxContainer/MarginContainer/HBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_item_to_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_item_to_list():
	for item in number_of_hands:
		var bet_button := bet_button_ui.instantiate()
		bet_button.text = str(item)
		bet_button.connect("pressed",on_bet_button_pressed.bind(bet_button))
		item_list.add_child(bet_button)

func on_bet_button_pressed(bet_button):
	print("wtf", bet_button.text)
	bet_list.push_back(bet_button.text)
	update_ui()

func update_ui():
	for child in upper_container.get_children():
		child.queue_free()
	for bet in bet_list:
		var btn = Button.new()
		btn.text = bet
		btn.theme = preload("res://assets/theme.tres")
		upper_container.add_child(btn)
