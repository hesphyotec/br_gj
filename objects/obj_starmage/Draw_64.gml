if (global.cs_active == false){
	draw_set_color(c_red);
	draw_sprite(spr_bosshp_back,0, 64,64);
	draw_rectangle(78,76,(76 + 1220* (hp / 2000)), 128, false);
	draw_sprite(spr_bosshp_outline,0,64,64);
	draw_set_color(c_white)
}