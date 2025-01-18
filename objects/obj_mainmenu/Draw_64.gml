var _rmx = display_get_gui_width()/2;
var _rmy = display_get_gui_height()/2;

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
}