
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	var n = get_node("anim_1")
	n.set_current_animation("work")
	n.play()
	
	n = get_node("anim_2")
	n.set_current_animation("work")
	n.play()
	pass


