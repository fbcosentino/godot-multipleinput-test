extends ReferenceRect

@onready var label = $Panel/Label

func take_keycode(keycode, text):
	if keycode == KEY_BACKSPACE:
		label.text = label.text.left( max(label.text.length()-1, 0))
	else:
		label.text += text
