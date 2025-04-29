/// Draw Code
gpu_set_depth(-90)
var _crad = spd *2
var _jig = 0;
if (spd >= 33){
	_jig = random_range(-2 - (bon_spd/2),2 + (bon_spd/2));
}
var _m_color = make_color_rgb(255-(random(255) * bon_spd/17),255-(random(255) * bon_spd/17),255-(random(255) * bon_spd/17));
var _in_col = c_fuchsia;
if (alarm[2] > 0){
	_m_color = c_red;
	_in_col = c_red;
	_jig = random_range(-16,16);
}

if (mega_charge){
	aura.color = _m_color;
	aura.brightness = 2;
} else {
	aura.brightness = 1;
	aura.color = c_red;
}
if (charge_shield == true){
	for(var i = 0; i < 360; i+= 10){
		var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
		var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
		draw_circle_color((x) + _xoff, (y) + _yoff, 16, c_white, _m_color, true);
	}
}

for(var i = 0; i < 360; i+= 45){
	var _xoff = lengthdir_x(circ_off, (circ_ang_off + i) mod 360);
	var _yoff = lengthdir_y(circ_off, (circ_ang_off + i) mod 360);
	draw_circle_color((x) + _xoff, (y) + _yoff, 16 + _crad + _jig, c_white, _in_col, true);
	draw_circle_color((x) + _xoff, (y) + _yoff, 15 + _crad + _jig, c_white, _in_col, true);
}

draw_circle_color((x), (y), 32 + _crad + _jig, c_black, _m_color, !(mega_charge));
draw_circle_color((x), (y), 31 + _crad + _jig, c_black, _m_color, true);
draw_circle_color((x), (y), 30 + _crad + _jig, c_black, _m_color, true);
draw_circle_color((x), (y), 29 + _crad + _jig, c_black, _m_color, true);

with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite_ext(spr_hp, 5-other.hp, (other.x), (other.y - 64), .5, .5, other.hp_rot, c_white, 1);
	surface_reset_target();
}

circ_ang_off = (circ_ang_off + (spd / 2)) mod 360;
hp_rot = (hp_rot - .5) mod 360

if (realspd >0) {
	for(var i = 1; i < 6; i++){
		draw_sprite_ext(spr_trail, image_index,  x -(lengthdir_x(realspd * xflip, mv_angle) * i), y -(lengthdir_y(realspd * yflip, mv_angle) * i), 1, 1, 0, _in_col, 1 / i);
	}
}
var ldir = round(point_direction(x,y, mouse_x, mouse_y)/90);
if (floor(spd) == 0 and charging == false){
	switch(ldir){
		case(0):
			image_index = clamp(image_index mod 8, 6, 8);
			break;
		case(1):
			image_index = clamp(image_index mod 4, 2, 8);
			break;
		case(2):
			image_index = clamp(image_index mod 6, 4, 8);
			break;
		case(3):
			image_index = clamp(image_index mod 2, 0, 2);
			break;
		case(4):
			image_index = clamp(image_index mod 8, 6, 8);
			break;
	}
	
} else {
	image_index = clamp(image_index mod 15, 8, 15);
	if (floor(spd) >0) {
		for(var i = 1; i < 6; i++){
			draw_sprite_ext(spr_trail, image_index,  x -(lengthdir_x(realspd * xflip, mv_angle) * i), y -(lengthdir_y(realspd * yflip, mv_angle) * i), 1, 1, 0, _in_col, 1 / i);
		}
	}
}

if (held == false){
	draw_self();
}
//Draws Launch Arrow
if charging{
	draw_set_color(make_color_rgb(255, 255-(255 * spd/33), 255-(255 *spd/33)));
	var arr_x = lengthdir_x(333, mv_angle)
	var arr_y = lengthdir_y(333, mv_angle)
	var col = make_color_rgb(255, 255-(255 * spd/66), 255-(255 *spd/66));
	
	
	draw_sprite_general(spr_launch_arrow,0, 0, 0, sprite_get_width(spr_launch_arrow), sprite_get_height(spr_launch_arrow),x, y, lerp(x,x + arr_x, spd/66), lerp(y,y + arr_y, spd/66), mv_angle, col, col, col, col, 1);
	draw_arrow(x,y, lerp(x,x + arr_x, spd/66), lerp(y,y + arr_y, spd/66), 32);
} else {
	draw_set_color(c_white)
}

if (mousetut){
	draw_sprite(spr_mouse_tut,0,x - 96, y);	
	draw_sprite(spr_mouse_tut,1,x + 96, y);	
}
if (spintut){
	draw_sprite(spr_spintut,0,x, y);	
}
//Debug
//draw_set_color(c_green)
//draw_text(x,y-10,spd);
//draw_text(x,y-20,grabbed);
//raw_text(x,y-30,charging);
//draw_text(x,y-40,knocked);
//draw_text(x,y-50,tut_e);

