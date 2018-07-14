
extends Node2D

var mv = null;
var cl = null;
var a_pos = [0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.11]

var timeout = 0;

func _process(delta):
	timeout -= delta
	if (timeout < 0):
		timeout = 0.1;
		var idx = randi()%12
		mv.seek( a_pos[idx], true )
		idx = randi()%11
		cl.seek( a_pos[idx], true )
		
	pass

func _ready():
	set_process(true)
	mv = get_node("anim_move")
	mv.set_current_animation("work")
	cl = get_node("anim_color")
	cl.set_current_animation("work")
	pass


