
extends Node2D

# sprites blk
var blk = [0,0,0,0,0,0];

#current scale of sprites
var scl = [0,0,0,0,0,0]

# to scale
var scl2 = [0,0,0,0,0,0]

func update_scale(idx, delta):
	
	if (scl[idx].y < scl2[idx].y): # scale bottom
		scl[idx].y += delta*4
		if (scl[idx].y > scl2[idx].y):
			scl[idx].y = scl2[idx].y
			
	else: # scale top
		scl[idx].y -= delta
		if (scl[idx].y < 0):
			scl[idx].y = scl2[idx].y
	
	blk[idx].set_scale( scl[idx] )
	
	pass
	
func _process(delta):
	for i in range(0,6):
		# if scale eqviv then set new scale
		if (scl[i].y == scl2[i].y):
			scl2[i].y = rand_range(0,1)
		#move to new scale
		update_scale(i, delta)
	pass

func _ready():
	set_process(true)
	
	for i in range(0,6):
		blk[i] = get_node( str("blk", i+1) )
		scl[i] = blk[i].get_scale()
		scl2[i] = scl[i]
		
	pass


