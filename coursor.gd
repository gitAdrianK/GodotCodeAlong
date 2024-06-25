extends Control

# When a domino gets clicked reparent it to coursor
# Make the coursor follow the actual coursor
# Reposition the child domino the same way we did dragging in unity
# Reparent it to the hand if released on top of the hand
# Otherwise something something playingfield

func add_child_to_coursor(node):
	self.add_child(node)

func reparent_to_coursor(node):
	node.reparent(self)
