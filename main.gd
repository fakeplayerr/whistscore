extends Control

@onready var name_input = $LineEdit
@onready var add_button = $Button
@onready var list_display = $RichTextLabel
@onready var health_display = $Health
@onready var player = Player.new()
@onready var game: GameInfo = GameInfo.new()

func _ready():
	add_button.connect("pressed", _on_button_pressed)
	
	player.take_damage(10)
	updateUI()

func updateUI():
	health_display.text = str(player.health)

func _on_button_pressed():
	player.take_damage(10)
	var player_name: String = name_input.text
	if player_name.strip_edges(true,true) != "":
		var player = Player.new()
		player.player_name = player_name
		game.add_player(player)
		name_input.clear()
		_update_list_display()
	
	updateUI()
	

func _update_list_display():
	list_display.clear()
	for player in game.players:
		list_display.add_text(player.player_name + "\n")
