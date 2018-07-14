
extends Node2D

var sounds

func _on_btn_gltron():
	sounds.play("btn_click_1")
	get_node("zone-display").move_to_gl()
	pass

func _on_btn_m3tron():
	sounds.play("btn_click_1")
	get_node("zone-display").move_to_m3()
	pass

func _on_btn_pztron():
	sounds.play("btn_click_1")
	get_node("zone-display").move_to_pz()
	pass
	
func _on_btn_artron():
	sounds.play("btn_click_1")
	get_node("zone-display").move_to_ar()
	pass
	

func _ready():
	sounds = get_node("sounds")
	
	get_node("anim").play("init");
	TranslationServer.set_locale("es")
	get_node("lbl_achives").set_text(tr("lbl_achives"))
	get_node("btn_zones/btn_gltron").connect("pressed", self, "_on_btn_gltron")
	get_node("btn_zones/btn_m3tron").connect("pressed", self, "_on_btn_m3tron")
	get_node("btn_zones/btn_pztron").connect("pressed", self, "_on_btn_pztron")
	get_node("btn_zones/btn_artron").connect("pressed", self, "_on_btn_artron")
	pass


