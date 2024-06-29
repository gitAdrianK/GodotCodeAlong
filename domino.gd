class_name Domino
extends Control

signal domino_clicked(domino : Domino)
signal domino_released(domino : Domino)

@onready var _top := $HBoxContainer/VBoxContainer/TopLabel
@onready var _bottom := $HBoxContainer/VBoxContainer/BottomLabel
@onready var _is_mouse_down := false


func _to_string() -> String:
	return "Domino(" + _top.text + "/" + _bottom.text + ")"


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if not event is InputEventMouseButton:
		return
	if event.button_index == MOUSE_BUTTON_MASK_LEFT:
		if not _is_mouse_down:
			emit_signal("domino_clicked", self)
		else:
			emit_signal("domino_released", self)
		_is_mouse_down = not _is_mouse_down


func set_both(new_top, new_bottom):
	set_top(new_top)
	set_bottom(new_bottom)


func set_top(new_text):
	_top.text = str(new_text)


func set_bottom(new_text):
	_bottom.text = str(new_text)
