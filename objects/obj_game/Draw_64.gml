if(global.player_dead and alarm[0] <=0){
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Try Again?");
}