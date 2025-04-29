if (global.cs_active == false){
	draw_set_color(c_red);
	draw_sprite(spr_boss2_hp_bg,0, 64,64);
	draw_rectangle(70,70,(70 + 1240* (hp / 4000)), 140, false);
	draw_sprite(spr_boss2_hp,0,64,64);
	draw_set_color(c_white)
}

if(mode == 5){
	draw_sprite_stretched_ext(spr_heal_screen,0,0,0,display_get_gui_width(), display_get_gui_height(), c_white, alarm[3] / 600);
}