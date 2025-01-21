hp = 3000;

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
lball = false;
knocked = false;
phase = 0;
axe_charge = false;
axes_thrown = 0;
smites = 0;
state = "none";
substate = "none";
spincharge = 3;
attcount = 0;
attmax = 3;


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
