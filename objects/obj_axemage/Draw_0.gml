var _crad = spd;
var _jig = 0;
var _mcolor = c_yellow;
var _mcolor2 = c_white;
image_speed = 1;
if (alarm[4] > 0){
	_mcolor = c_red;
	_mcolor2 = c_red;
	_jig = random_range(-16,16);
	image_speed = .25;
}

if (state == "smiting"){
	_jig = random_range(-16,16);
}
for(var i = 0; i < 360; i+= 60){
	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y+64) + _yoff, 32 + _crad + _jig, c_white, _mcolor2, true);
	draw_circle_color((x) + _xoff, (y+64) + _yoff, 32 + _crad + _jig, c_white, _mcolor2, true);
}

draw_circle_color((x), (y+64), 64 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y+64), 63 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y+64), 61 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y+64), 60 + _crad + _jig, c_black, _mcolor, true);
circ_ang_off = (circ_ang_off + (spd / 2) + spincharge) mod 360;


draw_self();