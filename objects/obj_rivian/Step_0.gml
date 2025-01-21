aura2.x = x;
aura2.y = y;
var _aurarad = 2;
aura2.x_rad = _aurarad;
aura2.y_rad = _aurarad;

spincharge = 3;

if(global.cs_active == false){
	// Death
	hp = clamp(hp, 0, 3000);
	phase = 5 - ceil(hp/250);
	if hp <= 0 {
		obj_musiccontrol.fadesong(100);
		obj_cutscener.start_cs("/ENDBOSS1");
	}

	// Aggression
	aggression += 1;
		
	if(state == "none"){
		attcount = 0;
		if (aggression > 100){
			state = "teleport";
			attmax = 3;
			substate = "none";
			alarm[3] = 60;
		}
		if (aggression > 250){
			state = "telespin";
			attmax = 3;
			substate = "none";
			alarm[3] = 60;
		}
		if (aggression > 300){
			state = "skulls";
			substate = "none";
		}
		
	}
		
	switch(state){
		case("teleport"):
			if (attcount >= attmax){
				state = "none";
				substate = "none";
				break;
			}
			if (alarm[3] <= 0 and alarm[0] <= 0){
				var _tpoint = [obj_player.x, obj_player.y];
				var _tang = random(360);
				x = _tpoint[0] + lengthdir_x(128, _tang);
				y = _tpoint[1] + lengthdir_y(128, _tang);
				alarm[0] = 30;
			}
			break;
		case("telespin"):
			switch(substate){
				case("none"):
					xflip = 1;
					yflip = 1;
					alarm[0] = 60;
					substate = "charging";
					break;
				case("charging"):
					if (attcount >= attmax){
						state = "none";
						substate = "none";
						aggression = 0;
						break;
					}
					spd++;
					break;
				case("spin"):
					spd = lerp(spd, 66, .01);
					x += lengthdir_x(spd * xflip, att_angle);
					y += lengthdir_y(spd * yflip, att_angle);
					scr_collision();
					stopwall();
					aura2.x_rad = 3;
					aura2.y_rad = 3;
					if (spd == 0){
						attcount++;
						alarm[0] = 60;
						substate = "charging";
					}
					break;
			}
			break;
		case("skulls"): // Capricorn Bombs
			switch(substate){
				case("none"):
					alarm[3] = 180;
					substate = "smite";
					alarm[1] = 600;
					break;
				case("smite"):
					if (alarm[3] <= 0){
						var tarx = random_range(1536 - 512, 1536 + 512);
						var tary = random_range(1536 - 512, 1536 + 512);
						instance_create_layer(tarx, tary, "Instances", obj_smite_cap)
						alarm[3] = 5;
					}
					break;
			}
			break;
		case("charging"):
			if (alarm[0] <= 0){ // sets charging alarm
				xflip = 1;
				yflip = 1;
				alarm[0] = 60;
			} else {
				x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
				y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
				spd++;
			}
			break;
		// Movement
		case("spin"):
			
			x += lengthdir_x(spd * xflip, att_angle);
			y += lengthdir_y(spd * yflip, att_angle);
			scr_collision();
			stopwall();
			aura2.x_rad = 3;
			aura2.y_rad = 3;
			if (floor(spd) == 0){
				alarm[0] = 60;
				state = "none";
			}
			break;
		case("stun"):
			if(alarm[2] <= 0){
				x += lengthdir_x(spd * xflip, att_angle);
				y += lengthdir_y(spd * yflip, att_angle);
				scr_collision();
				spd = lerp(spd, 0, .2);
				if (floor(spd) == 0){
					alarm[2] = 180;
				}
			}
			break;
		default:
			break;
	}
	if(instance_exists(obj_enemy_attack) and state != "spin" and substate != "spin"){
				instance_destroy(obj_enemy_attack);
	}
	if instance_place(x,y,obj_barr){
		spd = 0;
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
