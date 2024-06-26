class_name Coursor
extends Control

# When a domino gets clicked reparent it to coursor
# Make the coursor follow the actual coursor
# Reposition the child domino the same way we did dragging in unity
# Reparent it to the hand if released on top of the hand
# Otherwise something something playingfield

func add_domino_to_coursor(domino : Domino):
	self.add_child(domino)


func reparent_domino_to_coursor(domino : Domino):
	domino.reparent(self)
