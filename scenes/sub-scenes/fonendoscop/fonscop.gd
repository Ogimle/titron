
extends Node2D

func _ready():
	var n = get_node("anim")
	n.set_current_animation("work")
	n.play()
	pass


