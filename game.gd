extends Node2D

const Domino := preload("res://domino.tscn")

@onready var _rng := RandomNumberGenerator.new()
@onready var _playingfield := $Elements/Playingfield
@onready var _hand := $Elements/Hand
@onready var _coursor := $Elements/Coursor


func _ready():
	for i in range(6):
		var instance := Domino.instantiate()
		_hand.add_domino_to_hand(instance)
		instance.set_top(_rng.randi_range(0,6))
		instance.set_bottom(_rng.randi_range(0,6))
		instance.connect("domino_clicked", _on_domino_clicked)
		instance.connect("domino_released", _on_domino_released)
	_hand.arrange_dominos()


func _on_domino_clicked(domino : Domino):
	print(domino, " clicked!")


func _on_domino_released(domino : Domino):
	print(domino, " released!")
