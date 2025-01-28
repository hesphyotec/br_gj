hp = 1000;
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
alarm[3] = 600;

bnce = function(_obj){
	att_angle = obj_player.mv_angle;
}

minibounce = function(_obj){
	att_angle = obj_player.mv_angle;
	spd = spd/2;
	state = "stun";
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


aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_blue;
aura.color_thick = .5;
aura.whiteness = 1;
aura.x_rad = 3;
aura.y_rad = 3;

destroy_self = function(){
	instance_destroy(aura);	
	instance_destroy(self);
}
