extends Control

signal confirm

enum {
	NO,
	YES	
}

func _on_confirm_pressed():
	confirm.emit(YES)
	queue_free()


func _on_cancel_pressed():
	confirm.emit(NO)
	queue_free()	
