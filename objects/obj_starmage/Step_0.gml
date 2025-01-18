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
	
	if(aggression > 100 and state == "none"){
		state = "charging";
	}
	
	if (state == "charging" and alarm[0] <= 0){ // sets charging alarm
		xflip = 1;
		yflip = 1;
		alarm[0] = 300;
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
		if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
			xflip = 1;
			yflip = 1;
			alarm[0] = 30;
		} else if (floor(spd) == 0){
			state = "none";	
			dashes = 0;
		}
	} else if(instance_exists(obj_enemy_attack)){
		instance_destroy(obj_enemy_attack);
	}
	if instance_place(x,y,obj_barr){
		spd = 0;
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
