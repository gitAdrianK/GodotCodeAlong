class_name Hand
extends Control

@onready var _dominos := $Dominos


func add_child_to_hand(node : Node):
	_dominos.add_child(node)


func reparent_to_hand(node : Node):
	node.reparent(_dominos)


func arrange_dominos():
	var x : int = 10
	var y : int = 10
	for i in _dominos.get_child_count():
		var child : Node = _dominos.get_child(i)
		# If needed we could detect if x is larger than the dominos.size.x
		# and add child.size.y + 10 to y and reset x starting a new row
		child.set_position(Vector2(x, y))
		x += child.size.x + 10
