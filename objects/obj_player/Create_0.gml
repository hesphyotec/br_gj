/// Initialization and fundamental variables
// Declaration of speeds

spd = 4;
hspd = spd;
vspd = spd;
charging = false;
spinning = false;
moving = false;
mv_tarx = 0;
mv_tary = 0;
b_spd = 4;
cd = false;
hp = 5;
immune = false;
mv_angle = point_direction(x,y, mouse_x, mouse_y);
dft_angle = 0;
drift = false;
d_spd = 4;
deccel = .1;
atkout = false;
knocked = false;
charge_shield = false;
grabbed = false;
image_speed = 1;
realspd = 0;

get_spin_dir = function(){
	return point_direction(x,y, mouse_x, mouse_y);
}

// Weapons
weapon = 0// 0 = Shield

//Bonus Spin

b_angle = 0;
bon_spd = 0;
st_ang = get_spin_dir();
bounce = false;
xflip = 1;
yflip = 1;

bnce = function(_obj){
	if (place_meeting(x + lengthdir_x(hspd, mv_angle), y, _obj)){
		xflip = -xflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if (place_meeting(x, y  + lengthdir_y(vspd, mv_angle), _obj)){
		yflip = -yflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	
}

// circle stuff
circ_bounce = function(){
	var distx = x - 1110;
	var disty = y - 1110;

	var max_distance = 512;
	var current_angle = point_direction(0,0,distx,disty);

	var max_distx = lengthdir_x(max_distance,current_angle);
	var max_disty = lengthdir_y(max_distance,current_angle);

	if abs(distx) > abs(max_distx) {
		xflip = -xflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if abs(disty) > abs(max_disty) {
		yflip = -yflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
}

circ_minibounce = function(){
	var distx = x - 1110;
	var disty = y - 1110;

	var max_distance = 512;
	var current_angle = point_direction(0,0,distx,disty);

	var max_distx = lengthdir_x(max_distance,current_angle);
	var max_disty = lengthdir_y(max_distance,current_angle);

	if abs(distx) > abs(max_distx) {
		xflip = -xflip;
		spinning = false;
		knocked = true;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if abs(disty) > abs(max_disty) {
		yflip = -yflip;
		spinning = false;
		knocked = true;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
}

minibounce = function(_obj){
	if (place_meeting(x + lengthdir_x(hspd, mv_angle), y, _obj)){
		xflip = -xflip;
		spinning = false;
		knocked = true;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if (place_meeting(x, y  + lengthdir_y(vspd, mv_angle), _obj)){
		yflip = -yflip;
		spinning = false;
		knocked = true;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	
}

inframes = function(_frames){
	alarm[1] = _frames;	
}

grabthrow = function(_dir){
	mv_angle = (_dir + 180) mod 360;
	grabbed = true;
	spd = 30;
	deccel = 0;
}
	//var _difx = sign(_obj.x - x);
	//var _dify = sign(_obj.y - y);
	////if (_angle == 1 or _angle == 3){
	//	if (sign(lengthdir_y(vspd, mv_angle)) == _dify){
	//		yflip = -yflip;
	//	} else if (sign(lengthdir_y(hspd, mv_angle)) == _difx) {
	//		xflip = -xflip;
	//	}
	////}
	
atk = noone;

//Tutorial stuff

tut_q = false;
tut_w = false;
tut_e = false;

//Hud stuff
circ_off = 16;
circ_ang_off = 0;
hp_rot = 0;
mega_charge = false;


aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_fuchsia;
aura.color_thick = .7;
aura.whiteness = 1;