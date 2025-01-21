
aura2.x = x;
aura2.y = y;
var _aurarad = 2;
aura2.x_rad = _aurarad;
aura2.y_rad = _aurarad;
noattack = false;

if(global.cs_active == false){
	// Death
	hp = clamp(hp, 0, 2000);
	phase = 5 - ceil(hp/500);
	switch(phase){
		case(1):
			wheelrange = [0, 2];
			break;
		case(2):
			wheelrange = [3, 5];
			break;
		case(3):
			wheelrange = [6, 8];
			break;
		case(4):
			wheelrange = [9, 11];
			break;
	}
	if hp <= 0 {
		obj_musiccontrol.fadesong(100);
		obj_cutscener.start_cs("/ENDBOSS1");
	}

	// Aggression
	aggression += 1;
	if(aggression > 500 and state == "none"){
		wheel = false;
		state = "wheel";	
	}
	if(aggression > 100 and state == "none"){
		state = "charging";
	}
	switch(state){
		case("wheel"):
			if (!point_in_circle(x,y, obj_circlebg.x, obj_circlebg.y, 32)){
				att_angle = point_direction(x,y, obj_circlebg.x, obj_circlebg.y);
				x += lengthdir_x(33 * xflip, att_angle);
				y += lengthdir_y(33 * yflip, att_angle);
			} else if (!instance_exists(obj_astralwheel) and wheel = false){
				instance_create_layer(x,y, "Instances", obj_astralwheel);
				wheel = true;
			}
			if (mode != -1){
				state = "signatk";	
			}
			break;
				
		case("signatk"):
			switch(mode){
				case(0): // Aries Flame Dash
					switch(substate){
						case("none"):
							xflip = 1;
							yflip = 1;
							alarm[0] = 300;
							max_dash = 5;
							dashes = 0;
							substate = "charging";
							break;
						case("charging"):
							x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
							y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
							scr_circ_collision();
							circ_stop();
							spd++;
							break;
						case("spin"):
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							if(alarm[1] <= 0){
								instance_create_layer(x,y,"Instances", obj_firetrail);
								alarm[3] = 1;
							}
							if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
								xflip = 1;
								yflip = 1;
								alarm[0] = 30;
							} else if (floor(spd) == 0 and dashes >= max_dash){
								state = "none";	
								substate = "none";
								mode = -1;
								aggression = 0;
								dashes = 0;
							}
							break;
					}
					break;
				case(1): // Horn spin
					if(!instance_exists(obj_horns)){
						instance_create_layer(x,y,"Instances", obj_horns);
						alarm[1] = 300;
					}
					break;
				case(2): // Gemini clone
					switch(substate){
						case("none"):
							if(!instance_exists(obj_starclone)){
								x = x - 256;
								clone = instance_create_layer(x + 256,y,"Instances", obj_starclone);
								alarm[1] = 600;
							}
							xflip = 1;
							yflip = 1;
							alarm[0] = 300;
							max_dash = 5;
							dashes = 0;
							substate = "charging";
							clone.state = "charging";
							break;
						case("charging"):
							x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
							y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
							scr_circ_collision();
							circ_stop();
							spd++;
							break;
						case("spin"):
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							scr_circ_collision();
							if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
								xflip = 1;
								yflip = 1;
								alarm[0] = 30;
							}
							break;
					}
					break;
				case(3): // Cancer throw
					switch(substate){
						case("none"):
							xflip = 1;
							yflip = 1;
							alarm[0] = 180;
							max_dash = 3;
							dashes = 0;
							substate = "charging";
							break;
						case("charging"):
							x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
							y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
							scr_circ_collision();
							circ_stop();
							spd++;
							break;
						case("grab"):
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							if (instance_place(x,y, obj_player)){
								obj_player.grabthrow(att_angle);
								substate = "followup";
								alarm[0] = 60;
							}
							if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
								xflip = 1;
								yflip = 1;
								alarm[0] = 30;
							}
							if (floor(spd) == 0 and dashes >= max_dash){
								mode = -1;
								aggression = 0;
								dashes = 0;
								state = "none";	
								substate = "none";
							}
							break;
					}
					if (substate == "followup"){
						noattack = false;
						if (alarm[0] <= 0){
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							if (floor(spd) == 0) {
								xflip = 1;
								yflip = 1;
								alarm[0] = 180;
								max_dash = 3;
								substate = "charging";
							}
						}
					}
					break;
				case(4): // leo pounce
					switch(substate){
						case("none"):
							xflip = 1;
							yflip = 1;
							alarm[0] = 120;
							max_dash = 5;
							dashes = 0;
							substate = "charging";
							break;
						case("charging"):
							if (dashes >= max_dash){
								state = "none";	
								substate = "none";
								mode = -1;
								aggression = 0;
								dashes = 0;	
							}
							break;
						case("leap"):
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							if point_in_circle(x,y,ltarx, ltary, 32){
								substate = "pounce";	
							}
							break;
						case("pounce"):
							for(var i = 0; i < 360; i += 5){
								var _atk = instance_create_layer(x,y, "Instances", obj_firetrail);
								_atk.moving = true;
								_atk.dir = i;
							}
							alarm[0] = 60;
							substate = "charging";
							break;
					}
					break;
				case(5): //Virgo heal
					switch(substate){
						case("none"):
							alarm[1] = 600;
							substate = "heal";
							break;
						case("heal"):
							hp += .5;
							if(alarm[3] <= 0){
								obj_player.hp = clamp(obj_player.hp + 1, 0, 5);
								alarm[3] = 120;
							}
							break;
					}
					break;
				case(6): // Libra tilt
					switch(substate){
						case("none"):
							obj_circlebg.tilt = true;
							alarm[1] = 600;
							alarm[0] = 120;
							dashes = 0;
							max_dash = 3;
							substate = "charging";
							break;
						case("charging"):
							x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
							y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
							scr_circ_collision();
							circ_stop();
							tilt_stop();
							spd++;
							break;
						case("spin"):
							x += lengthdir_x(spd * xflip, att_angle);
							y += lengthdir_y(spd * yflip, att_angle);
							scr_circ_collision();
							circ_stop();
							tilt_stop();
							if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
								xflip = 1;
								yflip = 1;
								alarm[0] = 60;
							} else if (dashes >= max_dash){
								obj_circlebg.tilt = false;
								state = "none";	
								substate = "none";
								mode = -1;
								aggression = 0;
								dashes = 0;
							}
							break;
					}
					break;
				case(7): // Scorpio Sting
					switch(substate){
						case("none"):
							alarm[3] = 60;
							max_dash = 8;
							dashes = 0;
							substate = "sting";
							break;
						case("sting"):
							if(alarm[3] <= 0 and dashes < max_dash){
								instance_create_layer(x,y,"Instances", obj_stinger);
								dashes++;
								alarm[3] = 60;
							} else if (dashes >= max_dash){
								state = "none";	
								substate = "none";
								mode = -1;
								aggression = 0;
								dashes = 0;
							}
							break;
					}
					break;
				case(8): //Sagitarious shooting
					switch(substate){
						case("none"):
							alarm[3] = 180;
							substate = "shooting";
							alarm[1] = 600;
							break;
						case("shooting"):
							att_angle = (att_angle + 1) mod 360;
							if (alarm[3] <= 0){
								for(var i = 0; i < 4; i++){
									var _atk = instance_create_layer(x,y, "Instances", obj_arrow);
									_atk.tar = att_angle + random_range(-10, 0) + (90 * i);
								}
								alarm[3] = 5;
							}
							break;
					}
					break;
				case(9): // Capricorn Bombs
					switch(substate){
						case("none"):
							alarm[3] = 180;
							substate = "smite";
							alarm[1] = 600;
							break;
						case("smite"):
							if (alarm[3] <= 0){
								var tarx = random_range(1110 - 512, 1110 + 512);
								var tary = random_range(1110 - 512, 1110 + 512);
								instance_create_layer(tarx, tary, "Instances", obj_smite_cap)
								alarm[3] = 10;
							}
							break;
					}
					break;
				case(10): // Aquarius Laser
					switch(substate){
						case("none"):
							substate = "laser";
							instance_create_layer(x,y,"Instances", obj_laser);
							alarm[1] = 300;
							att_angle = 270;
							break;
						case("laser"):
							var pointdir = point_direction(x,y, obj_player.x, obj_player.y);
							att_angle = (sin(degtorad(pointdir - att_angle)) * 3 + att_angle) % 360;
					}
				case(11): // Pisces Dash
					switch(substate){
						case("none"):
							x = 1110 + lengthdir_x(p_rad, p_ang)
							y = 1110 + lengthdir_y(p_rad, p_ang)
							clone = instance_create_layer(x,y, "Instances", obj_starclone);
							var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
							_att.master = self;
							clone.state = "swirl";
							_att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
							_att.master = clone;
							alarm[1] = 600;
							substate = "swirl";
							break;
						case("swirl"):
							p_mult = (p_mult + .005);
							var mult = sin(pi * p_mult);
							p_ang = (p_ang + p_spd) mod 360;
							p_spd = lerp(p_spd, 2, .01);
							p_rad = 512 * mult;
							x = 1110 + lengthdir_x(p_rad, p_ang);
							y = 1110 + lengthdir_y(p_rad, p_ang);
							clone.x = 1110 - lengthdir_x(p_rad, p_ang);
							clone.y = 1110 - lengthdir_y(p_rad, p_ang);
							break;
					}
					break;
			}
			break;
		case("charging"):
			if(alarm[0] <= 0){ // sets charging alarm
				xflip = 1;
				yflip = 1;
				max_dash = 3;
				alarm[0] = 300;
			}
			if (alarm[0] > 0) { // plays spinning animation
				x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
				y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
				scr_circ_collision();
				circ_stop();
				spd++;
			}
			break;
	// Movement
		case("spin"):
			x += lengthdir_x(spd * xflip, att_angle);
			y += lengthdir_y(spd * yflip, att_angle);
			scr_circ_collision();
			circ_stop();
			if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
				xflip = 1;
				yflip = 1;
				alarm[0] = 30;
			} else if (floor(spd) == 0 and dashes >= max_dash){
				state = "none";	
				dashes = 0;
			}
			break;
		case("stun"):
		if(alarm[2] <= 0){
			x += lengthdir_x(spd * xflip, att_angle);
			y += lengthdir_y(spd * yflip, att_angle);
			scr_circ_collision();
			circ_stop();
			spd = lerp(spd, 0, .2);
			if (floor(spd) == 0){
				alarm[2] = 180;
			}
		}
		
	}	
	if(instance_exists(obj_enemy_attack) and (state != "spin" and substate != "spin" and substate != "followup" and substate != "swirl")){
		instance_destroy(obj_enemy_attack);
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
