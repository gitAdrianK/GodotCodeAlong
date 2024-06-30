class_name Coursor
extends Control

@onready var held_domino = $HeldDomino


func _physics_process(_delta):
	if held_domino.get_child_count() == 0:
		return
	var coursor_pos = get_global_mouse_position()
	var domino : Domino = held_domino.get_child(0)
	var half_x = domino.size.x / 2
	var half_y = domino.size.y / 2
	domino.position = coursor_pos - Vector2(half_x, half_y)

func _input(event):
	if held_domino.get_child_count() == 0:
		return
	if not event is InputEventMouseButton:
		return
	if not event.is_pressed():
		return
	if event.button_index == MOUSE_BUTTON_MASK_RIGHT:
		var domino : Domino = held_domino.get_child(0)
		domino.rotation_degrees = domino.rotation_degrees + 90


func add_domino_to_coursor(domino : Domino):
	domino.reparent(held_domino)
	domino.connect("domino_released", _remove_domino_from_coursor)
	domino.scale = Vector2(1.2, 1.2)


func _remove_domino_from_coursor(domino : Domino):
	# Dragging works, but we aren't checking if we actually can!
	var game_node : Game = get_tree().get_root().get_child(0)
	var playingfield : Playingfield = game_node.playingfield
	playingfield.add_domino_to_playingfield(domino)
	domino.disconnect("domino_released", _remove_domino_from_coursor)
	domino.scale = Vector2(1, 1)
