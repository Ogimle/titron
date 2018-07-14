extends Node2D 

var fl = null;
var en = null;
var sh = null;

var s_charge = null;
var s_power = null;

var charge_voice = 0;
var power_voice = 0;

var max_scale = 0;

var isRestoreEnergy = false;

var sh_hit_timer = 3;
var en_restore_speed = 0;
var fl_to_en = 0;

func _hit_shield(delta):
	sh_hit_timer -= delta;
	
	if (sh_hit_timer < 0):
		sh_hit_timer = rand_range( 5, 7 );
		
		randomize();
		
		if (50 < rand_range(1,100)):
			var sh_height = sh.get_scale();
			sh_height.y -= rand_range(3, 10);
		
			if ( sh_height.y < 0 ):
				sh_height.y = 0;
			
			sh.set_scale( sh_height );
	pass
	
func _restore_shield(delta):
	var h_sh = sh.get_scale();
	var h_en = en.get_scale();
	
	# shield damaged
	if (h_sh.y < max_scale):
		# restore shield
		h_sh.y += delta;
		sh.set_scale(h_sh);
		
		if ( !s_charge.is_playing() ):
			s_charge.play();
		
		# decraise energy
		h_en.y -= delta/3;
		if (h_en.y < 0):
			h_en.y = 0;
		en.set_scale(h_en);
	else:
		s_charge.stop();
		
	pass
	
func _restore_energy(delta):
	var h_en = en.get_scale();
	var h_fl = fl.get_scale();
	
	# energy alert
	if ( h_en.y < max_scale/10 ):
		isRestoreEnergy = true;
		s_power.play();
		get_node("anim").set_speed(2);
		
	# restore energy
	if (isRestoreEnergy):
		h_en.y += delta*3;
		if (h_en.y > max_scale):
			h_en.y = max_scale;
			isRestoreEnergy = false;
			get_node("anim").set_speed(1);
			s_power.stop();
		
		en.set_scale(h_en);
		
		# decraise energy
		h_fl.y -= delta/6;
		if (h_fl.y < 0):
			h_fl.y = max_scale;
		fl.set_scale(h_fl);
	pass

func _process(delta):
	_hit_shield(delta);
	_restore_shield(delta);
	
	_restore_energy(delta);
	pass

func _ready():
	fl = get_node("fl");
	en = get_node("en");
	sh = get_node("sh");
	
	s_charge = get_node("s_charge");
	s_power = get_node("s_power");
	
	max_scale = sh.get_scale().y;
	
	isRestoreEnergy = false;
	
	set_process(true);
	pass


