aura2.x = x;
aura2.y = y;
var _aurarad = 2;
aura2.x_rad = _aurarad;
aura2.y_rad = _aurarad;

spincharge = 3;

if(global.cs_active == false){
	// Death
	hp = clamp(hp, 0, 1000);
	if (hp <= 0 and phase == 3){
		obj_musiccontrol.fadesong(100);
		obj_cutscener.start_cs("/ENDBOSS1");
	}
	if (hp < 100 and phase < 3 and state == "none"){
		state = "grind";
		substate = "none";
		phase++;
	}

	// Aggression
	aggression += 1;
		
	if(state == "none"){
		attcount = 0;
		if (aggression > 100){
			switch(phase){
				case(1):
					state = "superspin";
					substate = "none";
					break;
				case(2):
					state = "teleport";
					attmax = 3;
					substate = "none";
					alarm[3] = 180;
					break;
				case(3):
					state = "clone_teleport";
					attmax = 3;
					substate = "none";
					alarm[3] = 180;
					break;
			}
		}
		if (aggression > 250 and phase == 1){
			var _atkchoice = irandom(4);
			switch(_atkchoice){
				case(0):
					state = "skulls";
					substate = "none";
					break;
				case(1):
					state = "scythes";
					substate = "none";
					attmax = 3;
					break;
				case(2):
					state = "clones";
					substate = "none";
					break;
				case(3):
					state = "s_throw";
					substate = "none";
					break;
				case(4):
					state = "jump";
					substate = "none";
					break;
			}
		} else if (aggression > 250 and phase == 2){
			var _atkchoice = irandom(4);
			switch(_atkchoice){
				case(0):
					state = "minions";
					substate = "none";
					break;
				case(1):
					state = "grab";
					substate = "none";
					break;
				case(2):
					state = "telespin";
					attmax = 3;
					substate = "none";
					alarm[3] = 180;
					break;
				case(3):
					state = "homing_clones";
					substate = "none";
					break;
				case(4):
					state = "spread_scythes";
					substate = "none";
					attmax = 5;
					break;
			}
		} else if (aggression > 250 and phase == 3){
			var _atkchoice = irandom(3)+1;
			switch(_atkchoice){
				case(0):
					state = "supertilt";
					substate = "none";
					break;
				case(1):
					state = "megaskulls";
					substate = "none";
					break;
				case(2):
					state = "minigrind";
					substate = "none";
					break;
				case(3):
					state = "crazy_teleport";
					substate = "none";
					break;
				case(4):
					state = "ultraspin";
					substate = "none";
					break;
			}
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
					alarm[0] = 180;
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
		case("scythes"):
			switch(substate){
				case("none"):
					alarm[3] = 180;
					substate = "charging";
					alarm[1] = 600;	
					break;
				case("charging"):
					if (alarm[3] <= 0){
						var atk = instance_create_layer(x,y,"Instances", obj_spinner);
						atk.tar = point_direction(x,y,obj_player.x, obj_player.y);
						if (alarm[0] <= 0){
							alarm[0] = 60;
						}
						alarm[3] = 60;
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
						alarm[0] = 60;
						substate = "charging";
					}
			}
			break;
		case("clones"):
			switch(substate){
				case("none"):
					alarm[1] = 600;
					alarm[3] = 60;
					substate = "spawn";
					break;
				case("spawn"):
					if(alarm[3] <=0){
						var dir = irandom(1);
						if (dir == 0){
							var _clone = instance_create_layer(1024, irandom_range(1024, 2048), "Instances", obj_r_clone);
							_clone.dir = 0;
						} else {
							var _clone = instance_create_layer(2048, irandom_range(1024, 2048), "Instances", obj_r_clone);
							_clone.dir = 180;
						}
						alarm[3] = 60; 
					}
					break;
			}
			break;
		case("s_throw"):
			switch(substate){
				case("none"):
					alarm[1] = 600;
					att = instance_create_layer(x, y, "Instances", obj_spinscythe);
					substate = "throw";
					break;
				case("throw"):
					x += lengthdir_x(4, point_direction(x,y, obj_player.x, obj_player.y));
					y += lengthdir_y(4, point_direction(x,y, obj_player.x, obj_player.y));
					break;
				
			}
			break;
		case("grab"):
			switch(substate){
				case("none"):
					attmax = 5;
					attcount = 0;
					substate = "charging";
					alarm[0] = 120;
					break;
				case("charging"):
					if (alarm[0] <= 0){
						if (attcount >= attmax){
							state = "none";
							substate = "none";
							attmax = 3;
							attcount = 3;
							aggression = 0;
							break;
						} else {
							alarm[0] = 120;	
						}
					}
					spd++;
					break;
				case("g_dash"):
					x += lengthdir_x(spd * xflip, att_angle);
					y += lengthdir_y(spd * yflip, att_angle);
					spd = lerp(spd, 0, .03);
					//scr_collision();
					//stopwall();
					aura2.x_rad = 3;
					aura2.y_rad = 3;
					if (instance_place(x,y, obj_player)){
						substate = "grab_spin";
						obj_player.spd = 0;
						obj_player.grabbed = true;
						obj_player.gmove = false;
						alarm[3] = 120;
						break;
					}
					if (floor(spd) == 0){
						substate = "charging";
					}
					break;
				case("grab_spin"):
					if(alarm[3] > 0){
						with(obj_player){
							spd = lerp(spd, 66, .1);
							mv_angle = (mv_angle + spd) mod 360;
							x = obj_rivian.x + lengthdir_x(32, mv_angle);
							y = obj_rivian.y + lengthdir_y(32, mv_angle);
							obj_player.grabbed = true;
							obj_player.gmove = false;
						}
						hp+=.3;
					} else {
						with(obj_player){
							grabthrow(random(360));
						}
						alarm[3] = 30;
						substate = "grab_follow";
					}
					break;
				case("grab_follow"):
					if (alarm[3] <= 0 and alarm[0] <= 0){
						alarm[0] = 60;
						var _tpoint = [obj_player.x, obj_player.y];
						x = _tpoint[0] + lengthdir_x(128, obj_player.mv_angle);
						y = _tpoint[1] + lengthdir_y(128, obj_player.mv_angle);
					}
					break;
			}
			break;
		case("grind"):
			switch(substate){
				case("none"):
					spd = lerp(spd, 10, .1);
					att_angle = point_direction(x,y, obj_player.x, obj_player.y);
					x += lengthdir_x(spd, att_angle);
					y += lengthdir_y(spd, att_angle);
					if (instance_place(x,y, obj_player)){
						substate = "towall";
						obj_player.spd = 0;
						obj_player.grabbed = true;
						obj_player.gmove = false;
					}
					break;
				case("towall"):
					x += lengthdir_x(spd, att_angle);
					y += lengthdir_y(spd, att_angle);
					scr_collision();
					obj_player.spd = 0;
					obj_player.grabbed = true;
					obj_player.gmove = false;
					obj_player.x = x;
					obj_player.y = y;
					if instance_place(x + lengthdir_x(spd, att_angle),y + lengthdir_y(spd, att_angle), obj_barr){
						spd = 0;
						substate = "grind";
						alarm[3] = 300;
						att_angle = 90 * round(att_angle/90);
						obj_camera.shake_scr(300,2);
					}
					break;
				case("grind"):
					if (alarm[3] > 0){
						spd = lerp(spd, 100, .01);
						hp = clamp(hp + (spd *.1), 100, 1000);
						var _checkx = lengthdir_x(spd, att_angle);
						var _checky = lengthdir_y(spd, att_angle);
						if instance_place(x + _checkx, y + _checky, obj_barr){
							att_angle = (att_angle + 90) mod 360;
						}
						x += lengthdir_x(spd, att_angle);
						y += lengthdir_y(spd, att_angle);
						scr_collision();
						obj_player.spd = 0;
						obj_player.grabbed = true;
						obj_player.gmove = false;
						obj_player.x = x;
						obj_player.y = y;
					} else {
						att_angle = point_direction(x,y, 1536, 1536);
						spd = lerp(spd, 1, .1);
						x += lengthdir_x(spd, att_angle);
						y += lengthdir_y(spd, att_angle);
						if(point_in_circle(1536, 1536, x,y, 32)){
							state = "none";
							substate = "none";
							aggression = 0;
							if(phase == 3){
								obj_player.hp = 5;	
							}
						}
					}
					break;
			}
			break;
		case("minions"):
			switch(substate){
				case("none"):
					alarm[1] = 600;
					substate = "spawn";
					break;
				case("spawn"):
					if(alarm[3] <=0){
						var dir = irandom(1);
						if (dir == 0){
							var _clone = instance_create_layer(1024, irandom_range(1024, 2048), "Instances", obj_minion);
							_clone.dir = 0;
						} else {
							var _clone = instance_create_layer(2048, irandom_range(1024, 2048), "Instances", obj_minion);
							_clone.dir = 180;
						}
						alarm[3] = 5; 
					}
					break;
			}
			break;
		case("jump"):
			switch(substate){
				case("none"):
					instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_jump_marker);
					substate = "inair";
					break;
				case("inair"):
					break;
				case("swing"):
					if(alarm[3] <= 0){
						instance_create_layer(x,y, "Instances", obj_enemy_swipe);
						state = "none";
						substate = "none";
						aggression = 0;
					}
					break;
			}
			break;
		case("superspin"):
			switch(substate){
				case("none"):
					alarm[0] = 120;
					substate = "charging";
					break;
				case("charging"):
					spd++;
					att_angle = point_direction(x,y, obj_player.x, obj_player.y);
					x+= lengthdir_x(2, att_angle);
					y+= lengthdir_y(2, att_angle);
					break;
				case("spin"):
					x+= lengthdir_x(spd * xflip, att_angle);
					y+= lengthdir_y(spd * yflip, att_angle);
					scr_collision();
					wallbounce(obj_barr);
					spd-=.1;
					if(floor(spd) == 0){
						state = "none";
						substate = "none";
					}
					break;
					
			}
			break;
		case("clone_teleport"):
			switch(substate){
				case("none"):
					if (attcount >= attmax){
						instance_destroy(obj_teleclone);
						state = "none";
						substate = "none";
						break;
					}
					if (alarm[3] <= 0 and alarm[0] <= 0){
						instance_destroy(obj_teleclone);
						var _tpoint = [obj_player.x, obj_player.y];
						var _tang = random(360);
						x = _tpoint[0] + lengthdir_x(128, _tang);
						y = _tpoint[1] + lengthdir_y(128, _tang);
						alarm[0] = 30;
						_tang += 90;
						instance_create_layer(_tpoint[0] + lengthdir_x(128,_tang), _tpoint[1] + lengthdir_y(128, _tang), "Instances", obj_teleclone);
						_tang += 90;
						instance_create_layer(_tpoint[0] + lengthdir_x(128,_tang), _tpoint[1] + lengthdir_y(128, _tang), "Instances", obj_teleclone);
						_tang += 90;
						instance_create_layer(_tpoint[0] + lengthdir_x(128,_tang), _tpoint[1] + lengthdir_y(128, _tang), "Instances", obj_teleclone);
					}
					break;
			}
			break;
		case("homing_clones"):
			switch(substate){
				case("none"):
					alarm[1] = 600;
					alarm[3] = 60;
					substate = "spawn";
					break;
				case("spawn"):
					if(alarm[3] <=0){
						var dir = irandom(1);
						if (dir == 0){
							var _clone = instance_create_layer(1024, irandom_range(1024, 2048), "Instances", obj_r_clone);
							_clone.dir = point_direction(_clone.x, _clone.y, obj_player.x, obj_player.y);
						} else {
							var _clone = instance_create_layer(2048, irandom_range(1024, 2048), "Instances", obj_r_clone);
							_clone.dir = point_direction(_clone.x, _clone.y, obj_player.x, obj_player.y);
						}
						alarm[3] = 30; 
					}
					break;
			}
			break;
		case("spread_scythes"):
			switch(substate){
				case("none"):
					alarm[3] = 180;
					substate = "charging";
					alarm[1] = 600;	
					break;
				case("charging"):
					if (alarm[3] <= 0){
						var atk = instance_create_layer(x,y,"Instances", obj_spinner);
						atk.tar = point_direction(x,y,obj_player.x, obj_player.y);
						atk.alarm[1] = 120;
						atk = instance_create_layer(x,y,"Instances", obj_spinner);
						atk.tar = (point_direction(x,y,obj_player.x, obj_player.y) - 30 mod 360);
						atk.alarm[1] = 120;
						atk = instance_create_layer(x,y,"Instances", obj_spinner);
						atk.tar = (point_direction(x,y,obj_player.x, obj_player.y) + 30 mod 360);
						atk.alarm[1] = 120;
						if (alarm[0] <= 0){
							alarm[0] = 60;
						}
						alarm[3] = 60;
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
						alarm[0] = 60;
						substate = "charging";
					}
			}
			break;
		case("megaskulls"):
			switch(substate){
				case("none"):
					alarm[3] = 120;
					substate = "smite";
					alarm[1] = 600;
					break;
				case("smite"):
					if (alarm[3] <= 0){
						var tarx = random_range(1536 - 512, 1536 + 512);
						var tary = random_range(1536 - 512, 1536 + 512);
						instance_create_layer(tarx, tary, "Instances", obj_smite_cap_mega);
						alarm[3] = 10;
					}
					break;
			}
			break;
		case("minigrind"):
			switch(substate){
				case("none"):
					attmax = 5;
					attcount = 0;
					substate = "charging";
					alarm[0] = 120;
					break;
				case("charging"):
					if (alarm[0] <= 0){
						if (attcount >= attmax){
							state = "none";
							substate = "none";
							attmax = 3;
							attcount = 3;
							aggression = 0;
							break;
						} else {
							alarm[0] = 120;	
						}
					}
					spd++;
					break;
				case("g_dash"):
					x += lengthdir_x(spd * xflip, att_angle);
					y += lengthdir_y(spd * yflip, att_angle);
					spd = lerp(spd, 0, .03);
					//scr_collision();
					//stopwall();
					aura2.x_rad = 3;
					aura2.y_rad = 3;
					if (instance_place(x,y, obj_player)){
						substate = "towall";
						obj_player.spd = 0;
						obj_player.grabbed = true;
						obj_player.gmove = false;
						alarm[3] = 120;
						break;
					}
					if (floor(spd) == 0){
						substate = "charging";
					}
					break;
				case("towall"):
					x += lengthdir_x(spd, att_angle);
					y += lengthdir_y(spd, att_angle);
					scr_collision();
					var _checkx = lengthdir_x(spd, att_angle);
					var _checky = lengthdir_y(spd, att_angle);
					if instance_place(x + _checkx,y + _checky, obj_barr){
						spd = 0;
						substate = "grind";
						alarm[3] = 300;
						obj_player.hp--;
						if instance_place(x + _checkx, y, obj_barr){
							if (obj_barr.x > x){
								att_angle = 90;	
							} else {
								att_angle = 270;
							}
						} else if (instance_place(x,y + _checky, obj_barr)){
							if (obj_barr.y > y){
								att_angle = 0;	
							} else {
								att_angle = 180;
							}		
						}
						obj_camera.shake_scr(5,10);
					}
					obj_player.spd = 0;
					obj_player.grabbed = true;
					obj_player.gmove = false;
					obj_player.x = x;
					obj_player.y = y;

					break;
				case("grind"):
					spd = lerp(spd, 10, .1);
					_checkx = lengthdir_x(spd, att_angle);
					_checky = lengthdir_y(spd, att_angle);
					if instance_place(x + _checkx, y + _checky, obj_barr){
						substate = "return";
						obj_player.grabbed = false;
					}
					x += lengthdir_x(spd, att_angle);
					y += lengthdir_y(spd, att_angle);
					scr_collision();
					obj_player.spd = 0;
					obj_player.grabbed = true;
					obj_player.gmove = false;
					obj_player.x = x;
					obj_player.y = y;
					obj_camera.shake_scr(5,5);
					break;
				case("return"):
					att_angle = point_direction(x,y, 1536, 1536);
					spd = 30;
					spd = lerp(spd, 1, .1);
					x += lengthdir_x(spd, att_angle);
					y += lengthdir_y(spd, att_angle);
					if(point_in_circle(1536, 1536, x,y, 32)){
						state = "none";
						substate = "none";
						aggression = 0;
					}
					break;
			}
			break;
		case("crazy_teleport"):
			switch(substate){
				case("none"):
					alarm[3] = 180;
					substate = "crazy";
					t_next = [obj_player.x, obj_player.y];
					alarm[1] = 600;
					break;
				case("crazy"):	
					if (alarm[3] <= 0 and alarm[0] <= 0){
						instance_destroy(obj_tmarker);
						var _tang = random(360);
						x = t_next[0] + lengthdir_x(128, _tang);
						y = t_next[1] + lengthdir_y(128, _tang);
						alarm[0] = 20;
					}
			}
			break;
		case("ultraspin"):
			switch(substate){
				case("none"):
					alarm[0] = 120;
					substate = "charging";
					break;
				case("charging"):
					spd++;
					break;
				case("spin"):
					x+= lengthdir_x(spd * xflip, att_angle);
					y+= lengthdir_y(spd * yflip, att_angle);
					scr_collision();
					wallbounce(obj_barr);
					spd-=.1;
					if(floor(spd) == 0){
						state = "none";
						substate = "none";
						instance_destroy(obj_spinner);
					}
					break;
			}
			break;
		case("supertilt"):
			switch(substate){
				case("none"):
					obj_squarebg.tilt = true;
					alarm[0] = 120;
					substate = "charging";
					break;
				case("charging"):
					spd++;
					att_angle = point_direction(x,y, obj_player.x, obj_player.y);
					x+= lengthdir_x(2, att_angle);
					y+= lengthdir_y(2, att_angle);
					break;
				case("spin"):
					x+= lengthdir_x(spd * xflip, att_angle);
					y+= lengthdir_y(spd * yflip, att_angle);
					//scr_collision();
					tiltbounce();
					spd-=.1;
					if(floor(spd) == 0){
						state = "none";
						substate = "none";
						obj_squarebg.tilt = false;
					}
					break;
					
			}
			break;
		//case("charging"):
		//	if (alarm[0] <= 0){ // sets charging alarm
		//		xflip = 1;
		//		yflip = 1;
		//		alarm[0] = 60;
		//	} else {
		//		x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
		//		y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
		//		spd++;
		//	}
		//	break;
		//// Movement
		//case("spin"):
		//	x += lengthdir_x(spd * xflip, att_angle);
		//	y += lengthdir_y(spd * yflip, att_angle);
		//	scr_collision();
		//	stopwall();
		//	aura2.x_rad = 3;
		//	aura2.y_rad = 3;
		//	if (floor(spd) == 0){
		//		alarm[0] = 60;
		//		state = "none";
		//	}
		//	break;
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
