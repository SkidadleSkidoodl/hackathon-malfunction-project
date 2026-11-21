extends Node2D

var card_pos: float = 1000
var intro_speed: float = 16


func _process(delta: float) -> void:
	if ($card_reader.position.y >= 500 || $card_reader.position.y <= 1000):
		intro_speed = 16
	elif ($card_reader.position.y >= 250 || $card_reader.position.y <= 499):
		intro_speed = 10
	elif ($card_reader.position.y >= 100 || $card_reader.position.y <= 249):
		intro_speed = 5
	elif ($card_reader.position.y >= 50 || $card_reader.position.y <= 99):
		intro_speed = 3
	elif ($card_reader.position.y >= 0 || $card_reader.position.y <= 49):
		intro_speed = 1

	if ($card_reader.position.y >= 0):
		_introslide()

func _introslide():
	card_pos = card_pos - intro_speed
