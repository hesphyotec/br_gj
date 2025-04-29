if (diag == true){
	if(room != rm_intro_cs){
		draw_set_color(c_black);
		draw_set_font(d_font);
		if(d_sprite != spr_){
			var _side = 64;
			if (d_sprite == spr_yve_diag){
				_side = display_get_gui_width() - 760;	
			}
			draw_sprite(d_sprite, talk_i, _side, 400);
			if (alarm[1] <= 0){
				alarm[1] = 6;
			}
		}
		if(d_tbox != spr_){
			draw_rectangle(0, display_get_gui_height() - 256, display_get_gui_width(), display_get_gui_height(), false);
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left)
		draw_text_ext(0, display_get_gui_height() - 240 , line, 64, display_get_gui_width());
	} else {
		draw_set_color(c_black);
		draw_set_alpha(a_fade);
		draw_set_font(d_font);
		if(d_sprite != spr_){
			draw_sprite(d_sprite, 0, 0, 0);
		}
		if(d_tbox != spr_){
			draw_rectangle(0, display_get_gui_height() - 240, display_get_gui_width(), display_get_gui_height(), false);
		}
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_halign(fa_left)
		draw_text_ext(8, display_get_gui_height() - 240 , line, 64, display_get_gui_width());
	}
}