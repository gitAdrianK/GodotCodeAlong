extends Node2D

@onready var _rng = RandomNumberGenerator.new()

@onready var _playingfield = $Elements/Playingfield
@onready var _hand = $Elements/Hand
@onready var _coursor = $Elements/Coursor

@onready var _domino = preload("res://domino.tscn")

func _ready():
	for i in range(6):
		var instance = _domino.instantiate()
		_hand.add_child_to_hand(instance)
		instance.set_top(_rng.randi_range(0,6))
		instance.set_bottom(_rng.randi_range(0,6))
		instance.connect("domino_clicked", _on_domino_clicked)
	_hand.arrange_dominos()

func _on_domino_clicked(domino):
	print(domino, " clicked!")
