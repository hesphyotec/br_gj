if (enabled and room == rm_testmenu){
	draw_set_circle_precision(100);

	//draw_circle_color(room_width/2, room_height/2, 512, c_purple, c_red, true);
	//draw_circle_color(room_width/2, room_height/2, 511, c_purple, c_red, true);
	//draw_circle_color(room_width/2, room_height/2, 510, c_purple, c_red, true);
	//draw_circle_color(room_width/2, room_height/2, 509, c_purple, c_red, true);
	if (menu == "Options"){
		aper = clamp(lerp(aper, room_height, .1), 0, room_height - 64);	
	} else if (alarm[1] > 0){
		aper = aper + room_width - (room_width * (alarm[1] / 30));
	} else {
		aper = clamp(lerp(aper, 0, .1), 0, room_height - 64);
	}

	for(var i = 0; i < 360; i+= 15){
		var _xoff = lengthdir_x(256, (circ_ang_off + i) mod 360);
		var _yoff = lengthdir_y(256, (circ_ang_off + i) mod 360);
		draw_circle_color((room_width/2) + _xoff, (room_height/2) + _yoff, 256 + aper, c_red, c_red, true);
	}
	for(var i = 0; i < 360; i+= circ_dist){
		var _xoff = lengthdir_x(circ_off, -(circ_ang_off + i) mod 360);
		var _yoff = lengthdir_y(circ_off, -(circ_ang_off + i) mod 360);
		draw_circle_color((room_width/2) + _xoff, (room_height/2) + _yoff, circ_len + aper, c_red, c_purple, true);
		draw_circle_color((room_width/2) + _xoff, (room_height/2) + _yoff, circ_len+1 + aper, c_red, c_purple, true);
	}

	if(circ_grow == true){
		circ_off = clamp(circ_off + .25, 64, 256);
		if (circ_off >= 256) {
			circ_grow = false;	
		}
	} else {
		circ_off = clamp(circ_off - .25, 64, 256);
		if (circ_off <= 64) {
			circ_grow = true;	
		}
	}
	circ_ang_off = (circ_ang_off + 1) mod 360;
	circ_len = clamp(circ_len + random_range(-1, 1), 0, 512);
	circ_dist = clamp(circ_dist + irandom_range(1,2), 0, 10);

	for(var i = 1; i < room_width/2; i = i * pulse_mult){
		draw_circle_color(room_width/2, room_height/2, 512+i + aper, c_red, c_red, true);
	}

	if (alarm[0] <= 0){
		if (pulse_out == true){
			pulse_mult = clamp(lerp(pulse_mult, 3, .2), 1.2, 2);
			if (pulse_mult >= 2){
				pulse_out = false;	
			}
		} else {
			pulse_mult = clamp(lerp(pulse_mult, 1.2, .2), 1.2, 2);
			if (pulse_mult <= 1.2){
				pulse_out = true;
				alarm[0] = 12;
			}
		}
	}
}