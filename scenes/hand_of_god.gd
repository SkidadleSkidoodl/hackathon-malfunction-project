extends AnimatedSprite2D

func _ready():
	animation = "front"
	$flip_hand.button_down.connect(_on_flip_hand_button_down)
	$flip_hand.button_up.connect(_on_flip_hand_button_up)

func _on_flip_hand_button_up() -> void:
	animation = "front"

func _on_flip_hand_button_down() -> void:
	animation = "back"
