class_name Playingfield
extends Control

func add_domino_to_playingfield(domino : Domino):
	domino.reparent(self)
