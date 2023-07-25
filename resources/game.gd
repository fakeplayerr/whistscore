extends Node
class_name GameInfo

@export var globals : GlobalInfo

#var tween = TweenEffect.new()
@onready var button_number_of_players = $StartScreen/PlayerCount/OptionButton
@onready var game_title_label = $StartScreen/GameTitle
@onready var player_list = $StartScreen/PlayerList
@onready var rounds_list_container = $GameScreen/ScrollContainer/HBoxContainer/RoundsList
@onready var rounds_grid = $GameScreen/ScrollContainer/HBoxContainer/RoundsGrid
@onready var current_round = 1
@onready var round_list = []
@onready var rounds_count = []
@onready var round_skin = preload("res://skins/round_skin.tscn")
@onready var round_header = preload("res://skins/round_header/round_header.tscn")
@onready var add_player_ui = preload("res://UI/add_player_ui/add_player_ui.tscn")
@onready var quit_game_dialog = preload("res://scenes/dialog.tscn")

func _ready() -> void:
	
	set_defaults()

func add_player_name(player_name):
	if player_name != "":
		var player = Player.new()
		player.name = player_name
#		scoreboard.round_manager.players.push_back(player)
		refresh_players_table()
	
func add_players_to_list(player_name):
	var new_label = Label.new()
	new_label.text = player_name
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	player_list.add_child(new_label)

func refresh_players_table():
	for child in player_list.get_children():
		player_list.remove_child(child)
#	for i in scoreboard.round_manager.players:
#		add_players_to_list(str(i.name))
		
func back_to_start_menu():
	var dialog = quit_game_dialog.instantiate()
	dialog.position = get_window().position
	print(get_window().position.x)
	print(get_window().position / 2)
	add_child(dialog)
	print("CALLED")
#	var tween = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
#	tween.tween_property($StartScreen, "position", Vector2(0,0),0.2)
#	var tween2 = get_tree().create_tween().bind_node(self).set_ease(Tween.EASE_OUT)
#	tween2.tween_property($GameScreen, "position", Vector2($GameScreen.size.x,0),0.2)
#	dialog.queue_free()
	


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
	
	
	refresh_round_list_table()
	refresh_round_list_grid()


func refresh_round_list_grid():
	rounds_grid.columns = globals.number_of_players
	for child in rounds_grid.get_children():
		rounds_grid.remove_child(child)
	
#	 currentRound: number;
#    rounds: IRound[];
#    players: Player[];
#    nextRound: () => void;
#    playersCount: number;
#    score: number[];
	
func add_round_to_grid():
	var round = round_skin.instantiate()
	rounds_grid.add_child(round)
#
#func calculateScore(round: number): 
#	for player in game.players:
#		let bet = game.rounds[round].bet[index];
#		let close = game.rounds[round].close[index];
#
#	if bet == close:
#		game.score[index] = game.score[index] + 5 + bet;
#
#	if bet !== close:
#	game.score[index] = game.score[index] - Math.abs(bet - close)
#
	
func add_rounds_to_grid():
	for child in globals.number_of_players:
		for r in round_list:
			var skin = round_skin.instantiate()
			skin.set_label(r)
			skin.set_color(Color.from_hsv(randf(),randf(),randf()))
			rounds_grid.add_child(skin)
		

func refresh_round_list_table():
	for child in rounds_list_container.get_children():
		rounds_list_container.remove_child(child)
#	rounds_list_container.columns = globals.number_of_players
	for r in round_list:
		var skin = round_header.instantiate()
		skin.set_label(r)
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
	globals.create_rounds()


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
	var apu = add_player_ui.instantiate()
	apu.connect("add_player",add_player_name)
	add_child(apu)

func open_bet_dialog():
	# create dialog
	# get inputs from dialog
	# place bet in rounds grid
	# get round as 3 inputs
	# cancel round in ui
	# add only if got the input
	pass

func _on_next_round_pressed() -> void:
	add_round_to_grid()
	current_round = current_round + 1
	$"GameScreen/Next Round".text = str("Next : ", current_round)
