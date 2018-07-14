
extends Node2D

var fig = null;
var anim = null;
var animtx = null;
var t1 = null;
var t2 = null;

var fig_timeout = 3;
var fig_timer = 1;
var anims = ['I', 'O', 'L', 'J', 'S', 'Z', 'T'];

var idx = -1;

func _process(delta):

	if (fig.is_visible()):
		fig.rotate_x(1*delta);
		fig.rotate_y(1*delta/2);
		fig.rotate_z(1*delta/4);
		
		fig_timer -= delta;
		
		if (fig_timer < 0):
			fig_timer = fig_timeout;
			idx += 1;
			if (idx==7):
				idx = 0;
			#var i = rand_range(0,7);
			anim.set_current_animation( anims[idx] );
			anim.play();
		
		if ( !animtx.is_playing() ):
			# change text 1
			var idx = t1.get_frame();
			if (idx==3):
				idx = 0;
			else:
				idx +=1;
			t1.set_frame(idx);

			# change text 2
			idx = t2.get_frame();
			if (idx==3):
				idx = 0;
			else:
				idx +=1;
			t2.set_frame(idx);

			animtx.set_current_animation('show');
			animtx.play();
			
	pass
	
func _ready():
	set_process(true);
	fig = get_node("Viewport/figure");
	anim = get_node("anim");
	animtx = get_node("anim_text");
	t1 = get_node("text1");
	t2 = get_node("text2");
	pass


