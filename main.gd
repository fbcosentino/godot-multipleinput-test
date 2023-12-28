extends Control


var mouse_rollers := {}
var keyboard_typers := {}

func _ready():
	Input.use_accumulated_input = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if (event is InputEventMouseButton):
		if (Input.mouse_mode != Input.MOUSE_MODE_CAPTURED) and (event.button_index == MOUSE_BUTTON_LEFT) and (event.pressed):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		print("Device ", event.device, " - Button ", event.button_index," ", "CLICKED" if event.pressed else "RELEASED")
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if (event is InputEventKey) and (event.pressed):
			if (event.keycode == KEY_ESCAPE):
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			else:
				receive_key(event.device, event.keycode, event.as_text_keycode())
		
		if (event is InputEventMouseMotion):
			receive_mouse_move(event.device, event.relative)
		

func receive_mouse_move(device, relative):
	if not device in mouse_rollers:
		var new_roller = preload("res://roller/roller.tscn").instantiate()
		$MouseScrollContainer/HBoxContainer.add_child(new_roller)
		mouse_rollers[device] = new_roller
	
	mouse_rollers[device].apply_relative(relative)

func receive_key(device, keycode, text):
	if not device in keyboard_typers:
		var new_typer = preload("res://typer/typer.tscn").instantiate()
		$KeyboardScrollContainer/HBoxContainer.add_child(new_typer)
		keyboard_typers[device] = new_typer
	
	keyboard_typers[device].take_keycode(keycode, text)
