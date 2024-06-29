class_name Coursor
extends Control

var _offset


func _process(_delta):
	if get_child_count() == 0:
		return
	var coursor_pos = get_viewport().get_mouse_position()
	get_child(0).set_position(coursor_pos + _offset)


func add_domino_to_coursor(domino : Domino):
	domino.reparent(self)
	domino.connect("domino_released", _remove_domino_from_coursor)
	_offset = domino.get_screen_position() - get_viewport().get_mouse_position()


func _remove_domino_from_coursor(domino : Domino):
	# Dragging works, but we aren't checking if we actually can!
	var game_node : Game = get_tree().get_root().get_child(0)
	var playingfield : Playingfield = game_node.playingfield
	playingfield.add_domino_to_playingfield(domino)

