//var _crad = spd *2
//var _jig = 0;
//if (spd >= 33){
//	_jig = random_range(-2 - (bon_spd/2),2 + (bon_spd/2));
//}
//var _m_color = make_color_rgb(255-(random(255) * bon_spd/17),255-(random(255) * bon_spd/17),255-(random(255) * bon_spd/17));
//if (mega_charge){
//	aura.color = _m_color;
//	aura.brightness = 2;
//} else {
//	aura.brightness = 1;
//	aura.color = c_red;
//}
//for(var i = 0; i < 360; i+= 10){
//	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
//	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
//	draw_circle_color((display_get_gui_width()/2) + _xoff, (display_get_gui_height() - 160) + _yoff, 32, c_white, _m_color, true);
//}

//for(var i = 0; i < 360; i+= 45){
//	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
//	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
//	draw_circle_color((display_get_gui_width()/2) + _xoff, (display_get_gui_height() - 160) + _yoff, 32 + _crad + _jig, c_white, c_fuchsia, true);
//	draw_circle_color((display_get_gui_width()/2) + _xoff, (display_get_gui_height() - 160) + _yoff, 31 + _crad + _jig, c_white, c_fuchsia, true);
//}

//draw_circle_color((display_get_gui_width()/2), (display_get_gui_height() - 161), 64 + _crad + _jig, c_black, _m_color, !(mega_charge));
//draw_circle_color((display_get_gui_width()/2), (display_get_gui_height() - 161), 65 + _crad + _jig, c_black, _m_color, true);
//draw_circle_color((display_get_gui_width()/2), (display_get_gui_height() - 161), 66 + _crad + _jig, c_black, _m_color, true);
//draw_circle_color((display_get_gui_width()/2), (display_get_gui_height() - 161), 67 + _crad + _jig, c_black, _m_color, true);

//draw_sprite_ext(spr_hp, 5-hp, (144), (144), 1, 1, hp_rot, c_white, 1);

//circ_ang_off = (circ_ang_off + (spd / 2)) mod 360;
//hp_rot = (hp_rot - .5) mod 360
if (alarm[2] > 0){
	draw_sprite_stretched_ext(spr_dmg_screen, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, 1 * (alarm[2] / 15));
}