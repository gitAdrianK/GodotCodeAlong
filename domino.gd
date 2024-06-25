extends Control

@onready var top = $HBoxContainer/VBoxContainer/TopLabel
@onready var bottom = $HBoxContainer/VBoxContainer/BottomLabel

@onready var clicked = false

signal domino_clicked(domino)
# Not doing anything with the released signal yet,
# probably want to connect it with the coursor though.
signal domino_released(domino)

func set_both(new_top, new_bottom):
	set_top(new_top)
	set_bottom(new_bottom)

func set_top(new_text):
	top.text = str(new_text)

func set_bottom(new_text):
	bottom.text = str(new_text)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if not event is InputEventMouseButton:
		return
	if event.button_index == MOUSE_BUTTON_MASK_LEFT:
		if clicked:
			emit_signal("domino_released", self)
		else:
			emit_signal("domino_clicked", self)
		clicked = !clicked

func _to_string():
	return "Domino(" + top.text + "/" + bottom.text + ")"
