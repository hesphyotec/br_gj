hp = 2000;

aggression = 0;
spd = 0;
hspd = 0;
vspd = 0;
target = obj_player;
att_angle = 0;
xflip = 1;
yflip = 1;
knocked = false;
phase = 0;
smites = 0;
state = "none";
substate = "none";
attcount = 0;
attmax = 3;
att = noone;
t_next = [0,0];

bnce = function(_obj){
	att_angle = obj_player.mv_angle;
}

tiltbounce = function(){
	var distx = x - 1536;
	var disty = y - 1536;
	var max_distance = 512;
	var max_distx = (obj_squarebg.xmat[0] + obj_squarebg.xmat[3])/2;
	var max_disty = (obj_squarebg.ymat[0] + obj_squarebg.ymat[1])/2;	
	if abs(distx) > abs(max_distx) {
		xflip = -xflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if abs(disty) > abs(max_disty) {
		yflip = -yflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}	
}
wallbounce = function(_obj){
	if (place_meeting(x + lengthdir_x(spd * xflip, att_angle), y, _obj)){
		xflip = -xflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if (place_meeting(x, y  + lengthdir_y(spd * yflip, att_angle), _obj)){
		yflip = -yflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
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

stopwall = function(){
	if (place_meeting(x + lengthdir_x(spd, att_angle), y, obj_barr)){
		spd = 0;
	}
	if (place_meeting(x, y  + lengthdir_y(spd, att_angle), obj_barr)){
		spd = 0
	}
	
}

circ_off = 32;
circ_ang_off = 0;
hp_rot = 0;

aura2 = instance_create_layer(x, y, "Lights", obj_lightsource);
aura2.color = c_purple;
aura2.color_thick = 1;
aura2.whiteness = 1;
aura2.x_rad = 3;
aura2.y_rad = 3;

if (global.quickdiag > 1){
	obj_cutscener.start_cs("/RIVIANINTROQUICK");
} else {
	obj_cutscener.start_cs("/RIVIANINTRO");
	global.user_data.update_value("diags",2);
}

