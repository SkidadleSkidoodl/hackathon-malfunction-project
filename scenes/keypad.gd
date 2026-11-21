extends Control

var typed_text: String
var passcode: String = "123"
var confirmation: int = 0

var number_of_guesses: int = 0
var guesses_allowed: int = 3
var timer = Timer.new()
var flash = Timer.new()
var square_is_red: bool = false
var buttons_enabled: bool = true

@onready var label: RichTextLabel = $VBoxContainer/RichTextLabel
@onready var square: Sprite2D = $square


func _ready() -> void:
	timer.autostart = false
	timer.one_shot = true
	timer.timeout.connect(_on_timer_Timeout)
	add_child(timer)
	flash.autostart = false
	flash.timeout.connect(_on_flash_Timeout)
	add_child(flash)

func _on_timer_Timeout():
	square.modulate = Color(1,1,1)
	typed_text = ""
	label.text = typed_text

func _on_flash_Timeout():
	if square_is_red:
		square.modulate = Color(1,1,1)
		square_is_red = false
	else:
		square.modulate = Color(1,0,0)
		square_is_red = true
	flash.start(0.5)


func _on_1_pressed() -> void:
	if buttons_enabled:
		typed_text += '1'
		label.text = typed_text
func _on_2_pressed() -> void:
	if buttons_enabled:
		typed_text += '2'
		label.text = typed_text
func _on_3_pressed() -> void:
	if buttons_enabled:
		typed_text += '3'
		label.text = typed_text
func _on_4_pressed() -> void:
	if buttons_enabled:
		typed_text += '4'
		label.text = typed_text
func _on_5_pressed() -> void:
	if buttons_enabled:
		typed_text += '5'
		label.text = typed_text
func _on_6_pressed() -> void:
	if buttons_enabled:
		typed_text += '6'
		label.text = typed_text
func _on_7_pressed() -> void:
	if buttons_enabled:
		typed_text += '7'
		label.text = typed_text
func _on_8_pressed() -> void:
	if buttons_enabled:
		typed_text += '8'
		label.text = typed_text
func _on_9_pressed() -> void:
	if buttons_enabled:
		typed_text += '9'
		label.text = typed_text
func _on_0_pressed() -> void:
	if buttons_enabled:
		typed_text += '0'
		label.text = typed_text
func _on_cancel_pressed() -> void:
	typed_text = typed_text.left(-1)
	label.text = typed_text
func _on_confirm_pressed() -> void:
	number_of_guesses += 1
	if number_of_guesses < guesses_allowed:
		if typed_text == passcode:
			square.modulate = Color(0,1,0)
			typed_text = "Correct"
			label.text = typed_text
			timer.start(0.5)
		elif typed_text != passcode:
			square.modulate = Color(1,0,0)
			typed_text = "Incorrect"
			label.text = typed_text
			timer.start(0.5)
	else:
		buttons_enabled = false
		typed_text = "Locked Out"
		label.text = typed_text
		square.modulate = Color(1,0,0)
		square_is_red = true
		flash.start(0.5)
