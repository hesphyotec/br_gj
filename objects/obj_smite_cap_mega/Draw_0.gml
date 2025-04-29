if (state == "charging"){
	var _crad = alarm[2] * 2;
	var _jig = 0;

	for(var i = 0; i < 360; i+= 60){
		var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
		var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
		draw_circle_color((x) + _xoff, (y) + _yoff, 64 + _crad + _jig, c_white, c_purple, true);
		draw_circle_color((x) + _xoff, (y) + _yoff, 64 + _crad + _jig, c_white, c_purple, true);
	}

	draw_circle_color((x), (y), 128 + _crad + _jig, c_black, c_red, true);
	circ_ang_off = (circ_ang_off + (alarm[2] / 2)) mod 360;
} else {
	with(obj_surface_effect){
		surface_set_target(effect_surf);
		draw_set_color(c_red);
		draw_circle(other.x,other.y,96,false);
		draw_set_color(c_white);
		surface_reset_target();
	}
}
