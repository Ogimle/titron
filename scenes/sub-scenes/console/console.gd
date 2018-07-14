extends Node2D

var sfx;
var txt;

var txt_diag = [
	"Init ...",
	"Main device ................ OK",
	"Count system ............ OK",
	"Drop device ................ OK",
	"Handle system .......... OK ",
	"All systems work fine."
];

var isDiagnostic = false;
var diagnostic_timeout = 0;
var diag_msg_idx = 0;
var diag_str_idx = 0;

var symbol_timout = 0.09;

func doDiagnostic(delta):
	# count timeout
	symbol_timout -= delta;
	
	# time is out, print symbol
	if (symbol_timout < 0):
		symbol_timout = 0.025;

		# new line
		if ( diag_str_idx == txt_diag[diag_msg_idx].length() ):
			txt.newline();
			txt.add_text("> ");
			diag_str_idx = 0;
			# new message
			diag_msg_idx += 1;
			if ( diag_msg_idx == txt_diag.size() ):
				isDiagnostic = false;
				diag_msg_idx = 0;
				txt.newline();
				txt.add_text("> ");
				return;

		# print
		sfx.play("pik");
		txt.add_text( txt_diag[diag_msg_idx].substr(diag_str_idx,1) );
		
		# new symbol
		diag_str_idx += 1;
	pass

func _process(delta):
	if ( get_z() > 0 ):
	
		diagnostic_timeout -= delta;
		if (diagnostic_timeout < 0):
			diagnostic_timeout = 10;
			isDiagnostic = true;
			
		if (isDiagnostic):
			doDiagnostic(delta);
			
	pass

func _ready():
	set_process(true);
	
	txt = get_node("txt");
	txt.clear();
	txt.set_scroll_follow(true);
	txt.add_text("> ");
	
	sfx = get_node("sfx");
	pass


