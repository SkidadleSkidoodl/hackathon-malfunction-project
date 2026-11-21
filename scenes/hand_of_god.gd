extends AnimatedSprite2D

@onready var woosh_sfx: AudioStreamPlayer2D = $woosh_sfx


func _ready():
	animation = "front"
	$flip_hand.button_down.connect(_on_flip_hand_button_down)
	$flip_hand.button_up.connect(_on_flip_hand_button_up)

func _on_flip_hand_button_up() -> void:
	animation = "front"
	woosh_sfx.pitch_scale = randf_range(-1, 2)
	woosh_sfx.play()
	

func _on_flip_hand_button_down() -> void:
	animation = "back"
	woosh_sfx.pitch_scale = randf_range(-1, 2)
	woosh_sfx.play()
