if (global.cs_active == false){
	draw_set_color(c_red);
	draw_sprite(spr_boss3_hp_bg,0, 64,64);
	draw_rectangle(70,70,(70 + 1240* (hp / 2000)), 140, false);
	draw_sprite(spr_boss3_hp,0,64,64);
	draw_set_color(c_white)
}
//draw_text(64,0,state);
//draw_text(64,100,substate);