var _crad = clamp(spd, 0, 100);
var _jig = 0;

for(var i = 0; i < 360; i+= 60){
	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, c_red, true);
	draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, c_red, true);
}
draw_circle_color((x), (y), 64 + _crad + _jig, c_black, c_red, true);
draw_circle_color((x), (y), 63 + _crad + _jig, c_black, c_red, true);
draw_circle_color((x), (y), 61 + _crad + _jig, c_black, c_red, true);
draw_circle_color((x), (y), 60 + _crad + _jig, c_black, c_red, true);
circ_ang_off = (circ_ang_off + (spd / 2)) mod 360;

draw_set_color(c_white);
//draw_text(x,y,state);
if (state == "charging"){
	sprite_index = spr_sm_c_clone;	
} else if (state == "spin" or state == "swirl"){
	sprite_index = spr_sm_s_clone;	
}
if(!instance_exists(obj_smage_attack)){
	draw_self();
}