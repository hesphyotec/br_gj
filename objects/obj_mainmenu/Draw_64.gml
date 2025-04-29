if(enabled){
	draw_set_alpha(1);
	var _rmx = display_get_gui_width()/2;
	var _rmy = display_get_gui_height()/2;
	if (room != rm_testmenu){
		draw_set_color(c_black);
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
		draw_set_color(c_white);
	}
	switch(menu){
		case("Main"):
			draw_set_font(fnt_largemain);
			draw_set_halign(fa_center);
			draw_text(_rmx, _rmy, "Sigil of Darkness");
			draw_set_font(fnt_main);
			if(selection == 0){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 128,"Start Game");
			draw_set_color(c_white);
			if(selection == 1){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 256, "Options");
			draw_set_color(c_white);
			if(selection == 2){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 384, "Close Game");
			draw_set_color(c_white);
			break;
		case("Options"):
			draw_set_font(fnt_largemain);
			draw_set_halign(fa_center);
			draw_text(_rmx, 128, "Options");
			draw_set_font(fnt_main);
			if(selection == 0){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text((_rmx) - 128, (_rmy),"Master Volume");
			draw_rectangle((_rmx + 256), (_rmy), (_rmx + 256) + 384 * (master_slide / 1), _rmy + 96, false);
			draw_set_color(c_white);
			if(selection == 1){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text((_rmx) - 128, (_rmy) + 128, "Music Volume");
			draw_rectangle((_rmx + 256), (_rmy) + 128, (_rmx + 256) + 384 * (music_slide / 1), _rmy + 128 + 96, false);
			draw_set_color(c_white);
			if(selection == 2){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text((_rmx) - 128, (_rmy) + 256, "Effects Volume");
			draw_rectangle((_rmx + 256), (_rmy) + 256, (_rmx + 256) + 384 * (effect_slide / 1), _rmy + 96 + 256, false);
			draw_set_color(c_white);
			if(selection == 3){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 384, "Back");
			draw_set_color(c_white);
			break;
		case("Pause"):
			draw_set_font(fnt_largemain);
			draw_set_halign(fa_center);
			draw_text(_rmx, _rmy, "Paused");
			draw_set_font(fnt_main);
			if(selection == 0){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 128,"Resume");
			draw_set_color(c_white);
			if(selection == 1){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 256, "Options");
			draw_set_color(c_white);
			if(selection == 2){
				draw_set_color(c_red);
			} else {
				draw_set_color(c_white);
			}
			draw_text(_rmx, (_rmy) + 384, "Main Menu");
			draw_set_color(c_white);
			break;
		case("Level"):
			if(global.level_unl >= 0){
				if (selection == 0){
					draw_set_color(c_yellow);
					draw_rectangle(_rmx - 720, _rmy - 360, _rmx - 360, _rmy + 360, false);
					draw_set_color(c_red);
				} else {
					draw_set_color(c_white);
				}
				draw_text(_rmx - 512, _rmy - 416, "The High Priestess");
				draw_text(_rmx - 512, _rmy - 96 - 416, "Ada Apollo");
				draw_sprite(spr_axemage, 0, _rmx - 512, _rmy);
			}
			
			if(global.level_unl >= 1){
				if (selection == 1){
					draw_set_color(c_blue);
					draw_rectangle(_rmx - 180, _rmy - 360, _rmx + 180, _rmy + 360, false);
					draw_set_color(c_red);
				} else {
					draw_set_color(c_white);
				}
				draw_text(_rmx , _rmy + 416, "The Astral Apostle");
				draw_text(_rmx , _rmy - 96 + 416, "Ragatha Sol");
				draw_sprite(spr_starmage_fin, 0, _rmx, _rmy);
			}
			if(global.level_unl >= 2){
				if (selection == 2){
					draw_set_color(c_purple);
					draw_rectangle(_rmx + 332, _rmy - 360, _rmx + 692, _rmy + 360, false);
					draw_set_color(c_red);
				} else {
					draw_set_color(c_white);
				}
				draw_text(_rmx + 512, _rmy - 416, "The Master Witch");
				draw_text(_rmx + 512, _rmy - 96 - 416, "Rivian Crescendo");
				draw_sprite(spr_rivian_idle,0, _rmx + 512, _rmy);
			}
	}
}