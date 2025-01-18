/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_released(vk_f1)){
	room_goto_next();
}


hspd = spd * xflip;
vspd = spd * yflip;

aura.x = x;
aura.y = y;
var _aurarad = 1 + spd/33 + random_range(-.05, .05);
aura.x_rad = _aurarad;
aura.y_rad = _aurarad;
if (weapon == 0){
	if (atkout == false){
		immune = charge_shield;
	} else {
		if (alarm[1] <= 0){
		alarm[1] = 6;
		}
	}
}

if (hp == 0){
	obj_musiccontrol.stopsong();
	room_goto(rm_testmenu)	
}

// Normal move code
//if (charging == false and spinning == false and moving == true){
//	mv_angle = point_direction(x,y, mv_tarx, mv_tary);
//	x += lengthdir_x(hspd, mv_angle);
//	y += lengthdir_y(vspd, mv_angle);
//	if (bounce){
//		if collision_rectangle(x-40, y-40, x+40,y +40,obj_barr, false, true){
//		bnce();
//		}
//	} else {
//		scr_collision();
//	}
//	if (x == mv_tarx and y == mv_tary){
//		moving = false;	
//	}
//}


// Wind up
if (knocked == false){
	if (mouse_check_button(mb_right) and global.can_charge == true){
		if (charging == false){
			audio_play_sound(snd_charge, 1, false, global.effectvol, 0, .75);
			charge_shield = true;
		}
		charging = true;
		if (spinning == true){
			drift = true;
			dft_angle = mv_angle;
			d_spd = spd;
			spinning = false;
		}
		if (drift == true and knocked == false) {
			d_spd = lerp(d_spd, 0, .1);
			x += lengthdir_x(d_spd * xflip, dft_angle);
			y += lengthdir_y(d_spd * yflip, dft_angle);
			scr_collision();
			if instance_place(x,y,obj_barr){
				if (bounce){
					bnce(instance_nearest(x,y,obj_barr));
				} else {
					minibounce(instance_nearest(x,y,obj_barr));
				}
				obj_camera.shake_scr(10,20 * (spd/33));
			}
		}
		bounce = false;
		spd = clamp(spd + .33, 0, 33);
		mv_angle = get_spin_dir();
		image_speed = clamp((.1 * spd), .25, 5);
		if(spd >= 33){
			var _angdif = sign(angle_difference(st_ang, get_spin_dir()));
			if (_angdif == -1) {
				bon_spd = clamp(bon_spd +.222, 0, 17);	
			}
			st_ang = get_spin_dir();
		} else {
			var _angdif = sign(angle_difference(st_ang, get_spin_dir()));
			if (_angdif == -1) {
				spd = clamp(spd +.666, 0, 33);	
			}
			st_ang = get_spin_dir();
		}
	}
}

if (bon_spd >= 17){
	mega_charge = true;	
	obj_camera.shake_scr(10,2);
}
if spinning == false and mouse_check_button(mb_left){
	moving = true;
	mv_tarx = mouse_x;
	mv_tary = mouse_y;
}

// Release charge
if (global.can_release == true){
	if (mouse_check_button_released(mb_right) and charging == true){
		// Gets mouse position and moves towards mouse
		audio_stop_sound(snd_charge);
		charging = false;
		xflip = 1;
		yflip = 1;
		spinning = true;
		charge_shield = false;
		d_spd = b_spd;
		if (bon_spd > 0){
			if (bon_spd == 17) {
				spd = 66;
				bon_spd = 0;
				bounce = true;
				deccel = .011;
				audio_play_sound(asset_get_index("snd_launch_long"+string(irandom_range(1,2))), 5, false, global.effectvol);
			} else {
				spd = spd + bon_spd;
				bon_spd = 0;
				deccel = .06;
				audio_play_sound(asset_get_index("snd_launch"+string(irandom_range(1,3))), 5, false, global.effectvol);
			}
		} else {
			audio_play_sound(asset_get_index("snd_launch"+string(irandom_range(1,3))), 5, false, global.effectvol);	
		}
		mega_charge = false;
		mv_angle = get_spin_dir();
		hspd = spd * xflip;
		vspd = spd * yflip;
		x += lengthdir_x(hspd, mv_angle);
		y += lengthdir_y(vspd, mv_angle);
		scr_collision();
		if (bounce){
			bnce(obj_barr);	
		} else {
			minibounce(obj_barr);
		}
		
		obj_camera.shake_scr(10,25);
		image_speed = clamp((.1 * spd), .25, 5);
	}
}
// Spin movement
if spinning == true and charging == false{
	spd = clamp(lerp(spd, b_spd, deccel), b_spd, spd);
	x += lengthdir_x(hspd, mv_angle);
	y += lengthdir_y(vspd, mv_angle);
	scr_collision();
	if (bounce){
		bnce(obj_barr);	
	} else {
		minibounce(obj_barr);
	}

	image_speed = clamp((.1 * spd), .25, 5);
	if (spd == b_spd){
		spinning = false;
	}
	obj_camera.shake_scr(1,1);
}

if (knocked == true){
	spd = lerp(spd, 0, .3);
	x += lengthdir_x(hspd, mv_angle);
	y += lengthdir_y(vspd, mv_angle);
	scr_collision();
	if (bounce){
		bnce(obj_barr);	
	} else {
		minibounce(obj_barr);
	}
	if (floor(spd) <= 0){
		knocked = false;
	}
}


// Combat
if (global.can_abil == true){
	if (mouse_check_button_pressed(mb_left) and cd == false and atkout == false and charging = true){
		if (bon_spd > 0){
			if (bon_spd == 17) {
				spd = 66;
				bon_spd = 0;
				bounce = true;
			} else {
				spd = spd + bon_spd;
				bon_spd = 0;
			}
		
		}
		var _att = instance_create_layer(x + lengthdir_x(64, mv_angle), y + lengthdir_y(64, mv_angle), "Instances", obj_shield);
		_att.toss(mv_angle, spd);
		_att.bounce = bounce;
		_att.deccel = clamp(deccel * .333, .05, deccel);
		_att.dmg = spd/4;
		atkout = true;
		spd = b_spd;
		tut_q = true;
	}
	//if (keyboard_check_pressed(ord("W")) and cd == false){
	//	if (atkout == true){
	//		if (object_exists(obj_shield)){
	//			obj_shield.expand();
	//		}
	//		cd = true;
	//	} else {
	//		var _att = instance_create_layer(x,y,"Instances",obj_shield);
	//		_att.mode = 1;
	//		atkout = true;
	//		cd = true;
	//	}
	//tut_w = true;
	//}

	//if (keyboard_check_pressed(ord("E")) and cd == false){
	//	if (atkout == true){
	//		if (object_exists(obj_shield)){
	//			var _tposx = x;
	//			var _tposy = y;
			
	//			x = obj_shield.x;
	//			y = obj_shield.y;
			
	//			obj_shield.ang = mv_angle;
	//			obj_shield.x = _tposx;
	//			obj_shield.y = _tposy;
			
	//			obj_camera.x = x;
	//			obj_camera.y = y;
	//			tut_e = true;
			
	//		}
	//		cd = true;
	//	} 
	//}
}
if (spinning == true and mouse_check_button(mb_left) and cd == false and atkout == false and global.can_attack == true){
	var _att = instance_create_layer(x, y, "Instances", obj_swipe);
	_att.image_angle = point_direction(x,y,mouse_x, mouse_y) - 90;
	_att.dmg = spd;
	cd = true
	audio_play_sound(asset_get_index("snd_sswing"+string(irandom_range(1,5))), 5, false, global.effectvol);
	alarm[0] = 15;
}

if (instance_place(x,y,obj_shield)){
	if (obj_shield.mode == 1 and alarm[1] <= 0){
		immune = true;
		alarm[1] = 6;
	}
}

//Tutorial stuff

if (global.cs_active == true){
	if(spd >= 33 and obj_cutscener.waitcode == "full_charge"){
		obj_cutscener.code = "full_charge";	
	}
	if(tut_q and tut_w and tut_e and obj_cutscener.waitcode == "tut_abil"){
		obj_cutscener.code = "tut_abil";	
	}
	if(instance_place(x,y,obj_axemage) and obj_cutscener.waitcode == "tut_charge"){
		obj_cutscener.code = "tut_charge";	
	}
}