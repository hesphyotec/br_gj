hp = 2000;
random_set_seed(get_timer());
aggression = 0;
spd = 0;
hspd = 0;
vspd = 0;
charging = false;
spinning = false;
target = obj_player;
att_angle = 0;
xflip = 1;
yflip = 1;
phase = 0;
max_dash = 3;
dashes = 0;
state = "none";
mode = -1;
substate = "none";
wheel = false;
noattack = false;
clone = noone;
ltarx = 0;
ltary = 0;
wheelrange = [0,2];
p_ang = 0;
p_rad = 512;
p_spd = 0;
p_mult = 0;
attk = noone;


bnce = function(_obj){
	att_angle = obj_player.mv_angle;
}

minibounce = function(_obj){
	att_angle = obj_player.mv_angle;
	spd = spd/2;
	state = "stun";
}


anim_tarx = 0;
anim_tary = 0;
anim_moving = false;
anim_endval = -1;
anim_val = -2;
anim_active = false
play_anim = function(_anim){
	switch(_anim){
		case("walk"):
			anim_active = true;
			anim_moving = true;
			anim_tarx = x;
			anim_tary = y + 1000;
			anim_endval = 0;
			break;
		
	}
}
endanim = function(){
	obj_cutscener.get_next_line();
	anim_active = false;
}

circ_off = 32;
circ_ang_off = 0;
hp_rot = 0;

circ_stop = function(){
	var distx = x - 1110;
	var disty = y - 1110;

	var max_distance = 512;
	var current_angle = point_direction(0,0,distx,disty);

	var max_distx = lengthdir_x(max_distance,current_angle);
	var max_disty = lengthdir_y(max_distance,current_angle);

	if abs(distx) > abs(max_distx) {
		spd = 0;
	}
	if abs(disty) > abs(max_disty) {
		spd = 0;
	}
}

tilt_stop = function(){
	var distx = x - 1110;
	var disty = y - 1110;
	var max_distance = 512;
	var current_angle = point_direction(distx, disty, 0, 0);
	var max_distx = lengthdir_x((obj_circlebg.xmat[0] + obj_circlebg.xmat[3])/2,current_angle);
	var max_disty = lengthdir_y((obj_circlebg.ymat[0] + obj_circlebg.ymat[1])/2,current_angle);	
	if abs(distx) > abs(max_distx) {spd = 0;}
	if abs(disty) > abs(max_disty) {spd = 0;}
}

aura2 = instance_create_layer(x, y, "Lights", obj_lightsource);
aura2.color = c_blue;
aura2.color_thick = .5;
aura2.whiteness = 1;
aura2.x_rad = 3;
aura2.y_rad = 3;

obj_musiccontrol.playsong(snd_boss2);