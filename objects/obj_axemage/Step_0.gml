aura.x = x;
aura.y = y+64;
var _aurarad = 1 + .25* (spd/11);
aura.x_rad = _aurarad;
aura.y_rad = _aurarad;

aura2.x = x;
aura2.y = y;
_aurarad = 2;
aura2.x_rad = _aurarad;
aura2.y_rad = _aurarad;

spincharge = 3;

if(global.cs_active == false){
	// Death
	hp = clamp(hp, 0, 1000);
	phase = 5 - ceil(hp/250);
	if hp <= 0 {
		obj_musiccontrol.fadesong(100);
		obj_cutscener.start_cs("/ENDBOSS1");
	}

	// Aggression
	aggression += 1;
		
	if(aggression > 500 and state == "none"){
		axes_thrown = 0;
		state = "axe_throw";
	}
	
	if(aggression > 250 and state == "none" and phase > 2){
		smites = 0;
		state = "smiting";
	}
	
	if(aggression > 100 and state == "none"){
		state = "charging";
	}

	if (state == "axe_throw"){
		spincharge = clamp(lerp(spincharge, 32, .3), 3, 32);
		if ((axes_thrown < phase) and alarm[1] <=0){
			alarm[1] = 60;
		} else if (axes_thrown >= phase){
			aggression = 0;
			state = "none";
		}
	}
	
	if (state == "smiting"){
		spincharge = clamp(lerp(spincharge, 32, .3), 3, 32);
		if ((smites < (phase *2)) and alarm[3] <=0){
			alarm[3] = 60;
		} else if (smites >= (phase * 2)){
			state = "none";
		}
	}
	
	if (state == "charging" and alarm[0] <= 0){ // sets charging alarm
		xflip = 1;
		yflip = 1;
		alarm[0] = 120;
	}
	if (alarm[0] > 0) { // plays spinning animation
		x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
		y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
		spd++;
	}
	// Movement
	if (state == "spin") {
		x += lengthdir_x(spd * xflip, att_angle);
		y += lengthdir_y(spd * yflip, att_angle);
		aura2.x_rad = 3;
		aura2.y_rad = 3;
		if (floor(spd) == 0){
			state = "none";
		}
	} else if(instance_exists(obj_enemy_attack)){
		instance_destroy(obj_enemy_attack);
	}
	if instance_place(x,y,obj_barr){
		spd = 0;
		state = "stun";
	}
	scr_collision();

	if (state == "stun" and alarm[2] <= 0){
		x += lengthdir_x(spd * xflip, att_angle);
		y += lengthdir_y(spd * yflip, att_angle);
		spd = lerp(spd, 0, .2);
		if (floor(spd) == 0){
			alarm[2] = 180;
		}
	}
} else if(anim_active == true){
	if (anim_endval == anim_val){
		endanim();
	}
	if (anim_moving == true){
		x += lengthdir_x(4, point_direction(x,y,anim_tarx, anim_tary))	
		y += lengthdir_y(4, point_direction(x,y,anim_tarx, anim_tary))
	}
	if point_in_circle(anim_tarx, anim_tary, x, y, 64){
		anim_moving = false;
		anim_val = 0;
	}
} else {
	if (collision_circle(x,y,200, obj_player, false , true) and obj_cutscener.waitcode == "intro_app"){
		obj_cutscener.code = "intro_app";
	}
	
}
