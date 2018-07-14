
extends Node2D

var selector
var sel_rect

var rb = Vector2(0,0)
var lt = Vector2(308,244)

var crd_gl = Vector2(299,170)
var crd_m3 = Vector2(210,135)
var crd_pz = Vector2(43,222)
var crd_ar = Vector2(205,47)

var dir
var dst
var dst_zn = "gl"
var zn = "gl"

func move_to_gl():
	zn = ""
	dst_zn = "gl"
	dst = crd_gl
	dir = crd_gl - sel_rect.pos
	pass
	
func move_to_m3():
	zn = ""
	dst_zn = "m3"
	dst = crd_m3
	dir = crd_m3 - sel_rect.pos
	pass
	
func move_to_pz():
	zn = ""
	dst_zn = "pz"
	dst = crd_pz
	dir = crd_pz - sel_rect.pos
	pass
	
func move_to_ar():
	zn = ""
	dst_zn = "ar"
	dst = crd_ar
	dir = crd_ar - sel_rect.pos
	pass


func pressed(stat):

	if (dst_zn == "gl"):
		move_to_m3()
	
	elif (dst_zn == "m3"):
		move_to_pz()
		
	elif (dst_zn == "pz"):
		move_to_ar()
		
	elif (dst_zn == "ar"):
		move_to_gl()
	pass
	
func _process(delta):
	print(zn, dst_zn)
	if ( zn != dst_zn):
		if (sel_rect.pos.distance_to(dst)>1):
			sel_rect.pos = sel_rect.pos + dir * delta
			selector.set_region_rect(sel_rect)
		else:
			zn = dst_zn
	pass

func _ready():
	set_process(true)
	
	selector = get_node("selector")
	sel_rect = selector.get_region_rect()

	get_node("cb").connect("toggled", self, "pressed")
	pass


