if(global.player_dead){
	draw_set_alpha(1 - (alarm[0]/120));
	draw_set_color(c_black);
	draw_rectangle(0,0, room_width, room_height, false);
	with(obj_dead_player){
		var _crad = other.respawn_charge * 2; 
		var _jig = other.respawn_charge /10;
		for(var i = 0; i < 360; i+= 45){
			var _xoff = lengthdir_x(other.respawn_charge, (circ_ang_off + i) mod 360);
			var _yoff = lengthdir_y(other.respawn_charge, (circ_ang_off + i) mod 360);
			draw_circle_color((x) + _xoff, (y) + _yoff, _crad + _jig, c_white, c_fuchsia, true);
			draw_circle_color((x) + _xoff, (y) + _yoff, 1+_crad + _jig, c_white, c_fuchsia, true);
		}
		draw_circle_color((x), (y),(_crad * 1.5) + _jig, c_black, c_white, true);
		draw_circle_color((x), (y),1+(_crad * 1.5)+ _jig, c_black, c_white, true);
		circ_ang_off = (circ_ang_off + (other.respawn_charge / 2)) mod 360;
		draw_self();
		image_index = clamp(image_index, 0, 8);
	}
}
