extends Node2D

var bullet = preload("res://rtwst/bullet.tscn")

var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = bullet.instantiate()
		new_bullet.position = get_global_mouse_position()
		var color1 = randf_range(100,200)
		var color2 = randf_range(100,200)
		var color3 = randf_range(100,200)
		print(color1,color2,color3)
#		new_bullet.modulate = Color(color1,color2,color3)
		new_bullet.modulate = Color.FOREST_GREEN
		add_child(new_bullet)
		go_to_main(new_bullet)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($SpawnPoint/Timer.get_time_left())
	pass

func new_date():
	floor(1.0)
	pass

func spawn_mob():
	var new_bullet = bullet.instantiate()
	new_bullet.position = $SpawnPoint.position
	add_child(new_bullet)
	go_to_main(new_bullet)

func go_to_main(bullet):
	
	var tween = create_tween()
#	for sprite in get_children():
	tween.tween_property(bullet, "position", Vector2($Player.position.x + (count*2), $Player.position.y),5)
	
	
	tween.tween_callback(countUp)
	#tween.finished.connect(countUp.bind(bullet))

func countUp():
	Time.notification(NOTIFICATION_POST_ENTER_TREE)
	count = count + 1
	$Label.text = "Stack: " + str(count)
#		
#	for button in $Buttons.get_children():
#    	button.pressed.connect(_on_pressed.bind(button))
#
#func _on_pressed(button):
#    print(button.name, " was pressed")


func _on_timer_timeout():
	spawn_mob()
