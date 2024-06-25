extends Node2D

@onready var rng = RandomNumberGenerator.new()

@onready var playingfield = $Elements/Playingfield
@onready var hand = $Elements/Hand
@onready var coursor = $Elements/Coursor

@onready var domino = preload("res://domino.tscn")

func _ready():
	for i in range(6):
		var instance = domino.instantiate()
		hand.add_child_to_hand(instance)
		instance.set_top(rng.randi_range(0,6))
		instance.set_bottom(rng.randi_range(0,6))
		instance.connect("domino_clicked", _on_domino_clicked)
	hand.arrange_dominos()

func _on_domino_clicked(domino):
	print(domino, " clicked!")
