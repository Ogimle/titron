extends Node2D


func _process(delta):
	if (get_z()>0):
		var n = get_node("anim");
		if ( false == n.is_playing() ):
			#n.set_current_animation("scan");
			#n.play();
		pass

func _ready():
	set_process(true);
	var n = get_node("anim");
	n.set_current_animation("scan");
	pass


