extends Node
class_name GameInfo

@export var scoreboard : Scoreboard
@export var globals : GlobalInfo

#var tween = TweenEffect.new()
@onready var button_number_of_players = $StartScreen/PlayerCount/OptionButton
@onready var game_title_label = $StartScreen/GameTitle
@onready var player_list = $StartScreen/PlayerList
@onready var rounds_list_container = $GameScreen/ScrollContainer/HBoxContainer/RoundsList
@onready var rounds_grid = $GameScreen/ScrollContainer/HBoxContainer/RoundsGrid
@onready var round_list = []
@onready var rounds_count = []
@onready var round_skin = preload("res://skins/round_skin.tscn")
@onready var round_header = preload("res://skins/round_header/round_header.tscn")

@onready var player_ui = $AddPlayerUI

func _ready() -> void:
	player_ui.connect("add_player",add_player_name)
	set_defaults()

func add_player_name(player_name):
	
	var player = Player.new()
	player.name = player_name
	scoreboard.round_manager.players.push_back(player)
	player_ui.hide()
	refresh_players_table()
	
func add_players_to_list(player_name):
	var new_label = Label.new()
	new_label.text = player_name
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	player_list.add_child(new_label)

func refresh_players_table():
	for child in player_list.get_children():
		player_list.remove_child(child)
	for i in scoreboard.round_manager.players:
		add_players_to_list(str("%s", i.name))
		
func back_to_start_menu():
	var tween = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
	tween.tween_property($StartScreen, "position", Vector2(0,0),0.2)
	var tween2 = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
	tween2.tween_property($GameScreen, "position", Vector2($GameScreen.size.x,0),0.2)
	

func create_rounds():
	round_list.clear()
	for i in globals.number_of_players:
		round_list.push_back("1")
	for i in range(2,8):
		round_list.push_back(str(i))
	for i in globals.number_of_players:
		round_list.push_back("8")		
	for i in range(7,1,-1):
		round_list.push_back(str(i))
	for i in globals.number_of_players:
		round_list.push_back("1")
	print("ROUNDS: ", round_list)

func set_defaults():
	# set game text
	game_title_label.text = globals.game_name
	# set global number of players
	globals.number_of_players = button_number_of_players.get_item_text(button_number_of_players.selected)
	# set the roundsList number
	print(globals.number_of_players)
	
#
#	for i in globals.number_of_players:
#		add_players(str("Player " , i))
	
	create_rounds()
	refresh_round_list_table()
	refresh_round_list_grid()


func refresh_round_list_grid():
	rounds_grid.columns = globals.number_of_players
	for child in rounds_grid.get_children():
		rounds_grid.remove_child(child)
	for child in globals.number_of_players:
		for round in round_list:
			var skin = round_skin.instantiate()
			skin.set_label(round)
			skin.set_color(Color.from_hsv(randf(),randf(),randf()))
			rounds_grid.add_child(skin)
		

func refresh_round_list_table():
	for child in rounds_list_container.get_children():
		rounds_list_container.remove_child(child)
#	rounds_list_container.columns = globals.number_of_players
	for round in round_list:
		var skin = round_header.instantiate()
		skin.set_label(round)
#		skin.set_color(Color.from_hsv(randf(),randf(),randf()))
		
		rounds_list_container.add_child(skin)


func start_game():
	animate_menu()

func _on_number_of_players_selected(index: int) -> void:
	print($StartScreen/PlayerCount/OptionButton.get_item_text(index))
	globals.number_of_players = button_number_of_players.get_item_text(index)
	print("GLOBALS: ", globals.number_of_players)
	refresh_players_table()
	refresh_round_list_table()
	refresh_round_list_grid()
	create_rounds()


func _on_next_button_up() -> void:
	start_game()


func _on_back_button_up() -> void:
	back_to_start_menu()
	
func animate_menu():
	var tween = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
	tween.tween_property($StartScreen, "position", Vector2(-$StartScreen.size.x,0),0.2)
	var tween2 = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
	tween2.tween_property($GameScreen, "position", Vector2(0,0),0.2)
#	for child in $GameScreen/RoundsList.get_children():
#		var animate_rounds = child.create_tween().tween_property($Sprite, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
#	tween.tween_property($Sprite, "scale", Vector2(), 1)
#	tween2.tween_callback($GameScreen.queue_free)
#	tween.tween_property($Sprite, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
#	tween.tween_property($Sprite, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
#	tween.tween_callback($Sprite.queue_free)

#	tween.tween_property($Sprite, "modulate", Color.RED, 1)
#	tween.tween_property($Sprite, "scale", Vector2(), 1)
#	tween.tween_callback($Sprite.queue_free)


#	for sprite in get_children():
#		tween.tween_property(sprite, "position", Vector2(0, 0), 1)


func _on_add_player_button_pressed():
	player_ui.show()
