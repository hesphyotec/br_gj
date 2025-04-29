if (state == "charging"){
	var _crad = alarm[1]/6;
	var _jig = 0;

	for(var i = 0; i < 360; i+= 60){
		var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
		var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
		draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, c_white, true);
		draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, c_white, true);
	}

	draw_circle_color((x), (y), 64 + _crad + _jig, c_black, c_yellow, true);
	draw_circle_color((x), (y), 63 + _crad + _jig, c_black, c_yellow, true);
	draw_circle_color((x), (y), 61 + _crad + _jig, c_black, c_yellow, true);
	draw_circle_color((x), (y), 60 + _crad + _jig, c_black, c_yellow, true);
	circ_ang_off = (circ_ang_off + (alarm[1] / 2)) mod 360;
} else {
	with(obj_surface_effect){
		surface_set_target(effect_surf);
		draw_rectangle(other.x-62,other.y, other.x+62, 0, false);
		draw_circle(other.x,other.y,62,false);
		surface_reset_target();
	}
}
