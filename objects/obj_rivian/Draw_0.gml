var _crad = spd;
var _jig = 0;
var _mcolor = c_red;
var _mcolor2 = c_purple;
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
	draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, _mcolor2, true);
	_xoff = lengthdir_x(circ_off, (90 + circ_ang_off + i) mod 360);
	_yoff = lengthdir_y(circ_off, (90 + circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, _mcolor, true);
}

draw_circle_color((x), (y), 64 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 63 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 61 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 60 + _crad + _jig, c_black, _mcolor, true);
circ_ang_off = (circ_ang_off + (spd / 2) + spincharge) mod 360;

if(substate == "spin"){
	sprite_index = spr_rivian_idle;
} else if (substate == "smite" or substate == "throw" or substate == "spawn" or substate == "grab_spin") {
	sprite_index = spr_rivian_charge;
	if (image_index > 3){
		image_index = 1;	
	}
} else if (substate == "g_dash" or (state == "grind" and substate == "none")) {
	sprite_index = spr_rivian_grab_fly;
	var _dir = round(att_angle/90);
	switch(_dir){
		case(0):
			image_index = clamp(image_index,4,5);
			break;
		case(1):
			image_index = clamp(image_index,6,7);
			break;
		case(2):
			image_index = clamp(image_index,2,3);
			break;
		case(3):
			image_index = clamp(image_index,0,1);
			break;
	}
} else if(state == "grind" and (substate == "towall" or substate == "grind")){
	sprite_index = spr_rivian_grind;
	var _dir = round(att_angle/90);
	switch(_dir){
		case(0):
			image_index = clamp(image_index,4,5);
			break;
		case(1):
			image_index = clamp(image_index,6,7);
			break;
		case(2):
			image_index = clamp(image_index,2,3);
			break;
		case(3):
			image_index = clamp(image_index,0,1);
			break;
	}
} else {
	sprite_index = spr_rivian_idle;
}
if(substate != "teleport" and substate != "grab_follow" and !(instance_exists(obj_enemy_swipe)) and !(instance_exists(obj_rivian_attack))){
	with(obj_surface_effect){
		surface_set_target(effect_surf);
		draw_sprite(other.sprite_index, other.image_index, other.x, other.y);
		surface_reset_target();
	}
}