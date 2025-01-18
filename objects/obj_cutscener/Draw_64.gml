if (diag == true){
	draw_set_color(c_black);
	draw_set_font(d_font);
	if(d_tbox != spr_){
		draw_rectangle(0, display_get_gui_height() - 256, display_get_gui_width(), display_get_gui_height(), false);
	}
	if(d_sprite != spr_){
		draw_sprite(d_sprite, 0, 64, 480)
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left)
	draw_text_ext(0, display_get_gui_height() - 240 , line, 64, display_get_gui_width());
}