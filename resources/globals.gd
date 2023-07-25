extends Resource
class_name GlobalInfo

@export var score : int = 0 : 
	set(value):
		score = value
	get:
		return score

@export var game_name : String
@export var number_of_players : int
@export var current_round : int



@export var rounds : Array[Round]



func create_rounds():
	for i in number_of_players:
		var round = Round.new()
		round.round_number = i
		rounds.push_back(round)
	for i in range(2,8):
		rounds.push_back(str(i))
	for i in number_of_players:
		rounds.push_back("8")		
	for i in range(7,1,-1):
		rounds.push_back(str(i))
	for i in number_of_players:
		rounds.push_back("1")
	print("ROUNDS: ", rounds)


func next_round():
	current_round = current_round + 1

func clear_rounds():
	rounds.clear()


