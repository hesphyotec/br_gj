if (global.cs_active == false){
	draw_set_color(c_red);
	draw_sprite(spr_bosshp_back,0, 64,64);
	draw_rectangle(70,70,(70 + 1240* (hp / 2000)), 140, false);
	draw_sprite(spr_bosshp_outline,0,64,64);
	draw_set_color(c_white)
}