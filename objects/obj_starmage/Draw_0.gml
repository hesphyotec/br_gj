var _crad = clamp(spd, 0, 100);
var _jig = 0;
var _mcolor = c_blue;
var _mcolor2 = c_teal;
image_speed = 1;
if (alarm[4] > 0){
	_mcolor = c_red;
	_mcolor2 = c_red;
	_jig = random_range(-16,16);
	image_speed = 2;
}
if (state == "wheel"){
	circ_off = lerp(circ_off, 64,.3);
	aura2.color = c_white;
	_crad = circ_off * 5;
	_jig = _jig = random_range(-8,8);
	aura2.x_rad = lerp(aura2.x_rad, 4, .1);
	aura2.y_rad = lerp(aura2.y_rad, 4, .1);
	_mcolor2 = c_ltgray;
	spd = lerp(spd, 100, .01);
} else {
	circ_off = 32;
	var _aurarad = 2 + irandom_range(-.01, .01) + (1 * spd/50);
	aura2.x_rad = _aurarad;
	aura2.y_rad = _aurarad;
	aura2.color = c_blue;
}
//if(alarm[4] > 0){
//	switch(indic){
//		case(1):
//			draw_set_color(c_red);
//			draw_line(x-512, y, x + 512, y);
//			draw_set_color(c_white);
//			break;
//		case(10):
//			draw_set_color(c_red);
//			draw_line(x, y, x, y + 512);
//			draw_set_color(c_white);
//			break;
//	}
//}
for(var i = 0; i < 360; i+= 60){
	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 32 + _crad + _jig, c_white, _mcolor2, true);
	draw_circle_color((x) + _xoff, (y) + _yoff, 31 + _crad + _jig, c_white, _mcolor2, true);
}
draw_circle_color((x), (y), 64 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 63 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 61 + _crad + _jig, c_black, _mcolor, true);
draw_circle_color((x), (y), 60 + _crad + _jig, c_black, _mcolor, true);
circ_ang_off = (circ_ang_off + (spd / 2)) mod 360;

draw_set_color(c_white);
//draw_text(x,y,state);

if((state == "none") and substate == "none"){
	sprite_index = spr_starmage_fin;
	image_index = (image_index mod 2);
} else if (state == "charging" or state == "spin"){
	image_index = clamp(image_index mod 9, 2, 9);
}
if(state == "wheel"){
	sprite_index = spr_sm_t_wind;
	if(image_index > 4){
		image_index = 3
	}
}

if(state == "signatk"){
	if(t_anim == true){
		switch(mode){
			case(0):
				sprite_index = spr_sm_t_aries;
				break;
			case(1):
				sprite_index = spr_sm_t_base;
				break;
			case(2):
				sprite_index = spr_sm_t_base;
				break;
			case(3):
				sprite_index = spr_sm_t_cancer;
				break;
			case(4):
				sprite_index = spr_sm_t_leo;
				break;
			case(5):
				sprite_index = spr_sm_t_virgo;
				break;
			case(6):
				sprite_index = spr_sm_t_base;
				break;
			case(7):
				sprite_index = spr_sm_t_scorpio;
				break;
			case(8):
				sprite_index = spr_sm_t_saggitarius;
				break;
			case(9):
				sprite_index = spr_sm_t_capricorn;
				break;
			case(10):
				sprite_index = spr_sm_t_aquarius;
				break;
			case(11):
				sprite_index = spr_sm_t_base;
				break;
		}
		if (image_index > 4){
			t_anim = false;
		}
	} else {
		switch(mode){
			case(0):
				sprite_index = spr_sm_c_aries;
				if (substate == "spin"){
					sprite_index = spr_sm_s_aries;
				}
				break;
			case(1):
				sprite_index = spr_starmage_fin;
				break;
			case(2):
				sprite_index = spr_starmage_fin;
				break;
			case(3):
				sprite_index = spr_starmage_fin;
				if (substate == "followup"){
					sprite_index = spr_sm_s_cancer;
				}
				break;
			case(4):
				sprite_index = spr_sm_pounce;
				if (substate == "charging"){
					if (image_index > 5){
						image_index = 2;
					}
				} else if (substate == "leap"){
					image_index = clamp(image_index mod 8, 6, 8);
				} else if (substate == "pounce") {
					if (image_index > 5){
						image_index = 2;
					}	
				}
				break;
			case(5):
				sprite_index = spr_sm_c_virgo;
				break;
			case(6):
				sprite_index = spr_starmage_fin;
				break;
			case(7):
				sprite_index = spr_sm_t_scorpio;
				break;
			case(8):
				sprite_index = spr_sm_s_base;
				break;
			case(9):
				sprite_index = spr_sm_cap_charge;
				break;
			case(10):
				sprite_index = spr_sm_t_aquarius;
				break;
			case(11):
				sprite_index = spr_starmage_fin;
				break;
		}
	}
}
if(!instance_exists(obj_smage_attack)){
	draw_self();
}