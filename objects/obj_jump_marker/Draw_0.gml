var _mcolor = c_red;
var _mcolor2 = c_purple;
for(var i = 0; i < 360; i+= 60){
	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 128, c_white, _mcolor2, true);
	_xoff = lengthdir_x(circ_off, (90 + circ_ang_off + i) mod 360);
	_yoff = lengthdir_y(circ_off, (90 + circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 128, c_white, _mcolor, true);
}

draw_circle_color((x), (y), 256, c_black, _mcolor, true);
draw_circle_color((x), (y), 255, c_black, _mcolor, true);
draw_circle_color((x), (y), 254, c_black, _mcolor, true);
draw_circle_color((x), (y), 253, c_black, _mcolor, true);
circ_ang_off = (circ_ang_off + (100 * (1/(alarm[0] * 10)))) mod 360;
