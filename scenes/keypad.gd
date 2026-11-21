extends Control

var typed_text: String
var passcode: String = "0"
var confirmation: int = 0

@onready var button_press_sfx: AudioStreamPlayer2D = $button_press_sfx
@onready var ding_sfx: AudioStreamPlayer2D = $ding_sfx
@onready var error_sfx: AudioStreamPlayer2D = $error_sfx
@onready var logoff_sfx: AudioStreamPlayer2D = $logoff_sfx


var stage: int = 0


var number_of_guesses: int = 0
var guesses_allowed: int = 999
var timer = Timer.new()
var flash = Timer.new()
var square_is_red: bool = false
var buttons_enabled: bool = true

@onready var label: RichTextLabel = $VBoxContainer/RichTextLabel
@onready var square: Sprite2D = $square

func _process(delta: float) -> void:
	if stage == 0:
		passcode = "1"
		$screen.animation = "stage_0"
	if stage == 1:
		$screen.animation = "stage_1"
	if stage == 2:
		$screen.animation = "stage_2"
		passcode = "8005882300339143"
	if stage == 3:
		$screen.animation = "stage_3"

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
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_2_pressed() -> void:
	if buttons_enabled:
		typed_text += '2'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_3_pressed() -> void:
	if buttons_enabled:
		typed_text += '3'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_4_pressed() -> void:
	if buttons_enabled:
		typed_text += '4'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_5_pressed() -> void:
	if buttons_enabled:
		typed_text += '5'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_6_pressed() -> void:
	if buttons_enabled:
		typed_text += '6'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_7_pressed() -> void:
	if buttons_enabled:
		typed_text += '7'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_8_pressed() -> void:
	if buttons_enabled:
		typed_text += '8'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_9_pressed() -> void:
	if buttons_enabled:
		typed_text += '9'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_0_pressed() -> void:
	if buttons_enabled:
		typed_text += '0'
		label.text = typed_text
		button_press_sfx.pitch_scale = randf_range(-1, 2)
		button_press_sfx.play()
func _on_cancel_pressed() -> void:
	typed_text = typed_text.left(-1)
	label.text = typed_text
	button_press_sfx.pitch_scale = randf_range(-1, 2)
	button_press_sfx.play()
func _on_confirm_pressed() -> void:
	number_of_guesses += 1
	button_press_sfx.pitch_scale = randf_range(-1, 2)
	button_press_sfx.play()
	if number_of_guesses < guesses_allowed:
		if typed_text == passcode:
			ding_sfx.play()
			if stage == 2:
				passcode = "8005882300339143"
				if stage == 3:
					logoff_sfx.play()
			square.modulate = Color(0,1,0)
			if stage == 0 || stage == 1:
				typed_text = "Proceeding"
				label.text = typed_text
			else:
				typed_text = "Correct"
				label.text = typed_text
			timer.start(0.5)
			stage += 1
		elif typed_text != passcode:
			error_sfx.play()
			square.modulate = Color(1,0,0)
			if stage == 0 || stage == 1:
				typed_text = "Wrong Answer"
				label.text = typed_text
			else:
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
