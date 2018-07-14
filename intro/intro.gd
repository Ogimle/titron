
extends Node2D

var block_colors=[
	Color(1,0.5,0.5),
	Color(0.5,1,0.5),
	Color(0.5,0.5,1),
	Color(0.8,0.4,0.8),
	Color(0.8,0.8,0.4),
	Color(0.4,0.8,0.8),
	Color(0.7,0.7,0.7)];
	
func _ready():
	randomize();
	
	var c = 0;
	
	for cnt in range(1,13):
		var n = get_node( str('f', cnt) );
		for q in range(1,5):
			n.get_node(str('q',q)).set_modulate( block_colors[c] );
		c = c + 1;
		if ( c==7 ):
			c = 0;
	
	get_node('anim').play('intro');

	pass


