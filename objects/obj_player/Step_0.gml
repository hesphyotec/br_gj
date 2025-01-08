/// @description Insert description here
// You can write your code in this editor
hspd = spd * xflip;
vspd = spd * yflip;

if (weapon == 0){
	if (atkout == false){
		immune = charging;
	} else {
		if (alarm[1] <= 0){
		alarm[1] = 6;
		}
	}
}

if (hp == 0){
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
			audio_play_sound(snd_charge, 1, false, .25, 0, 1.5);
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
			if collision_circle(x,y,44,obj_barr, false, true){
				if (bounce){
					bnce(instance_nearest(x,y,obj_barr));
				} else {
					minibounce(instance_nearest(x,y,obj_barr));
				}
			}
		}
		bounce = false;
		spd = clamp(spd + .666, 0, 66);
		mv_angle = get_spin_dir();
		image_speed = clamp((.1 * spd), .25, 5);
		if(spd >= 66){
			var _angdif = sign(angle_difference(st_ang, get_spin_dir()));
			if (_angdif == -1) {
				bon_spd = clamp(bon_spd +.666, 0, 34);	
			}
			st_ang = get_spin_dir();
		} else {
			var _angdif = sign(angle_difference(st_ang, get_spin_dir()));
			if (_angdif == -1) {
				spd = clamp(spd +.666, 0, 66);	
			}
			st_ang = get_spin_dir();
		}
	}
}
if spinning == false and mouse_check_button(mb_left){
	moving = true;
	mv_tarx = mouse_x;
	mv_tary = mouse_y;
}

// Release charge
if (mouse_check_button_released(mb_right) and charging == true){
	// Gets mouse position and moves towards mouse
	charging = false;
	spinning = true;
	xflip = 1;
	yflip = 1;
	d_spd = b_spd;
	if (bon_spd > 0){
		if (bon_spd == 34) {
			spd = 222;
			bon_spd = 0;
			bounce = true;
			deccel = .011;
		} else {
			spd = spd + bon_spd;
			bon_spd = 0;
			deccel = .06;
		}
	}
	mv_angle = get_spin_dir();
	x += lengthdir_x(hspd, mv_angle);
	y += lengthdir_y(vspd, mv_angle);
	scr_collision();
	if collision_circle(x,y,44,obj_barr, false, true){
		if (bounce){
			bnce(instance_nearest(x,y,obj_barr));
		} else {
			minibounce(instance_nearest(x,y,obj_barr));
		}
	}
	image_speed = clamp((.1 * spd), .25, 5);
}

// Spin movement
if spinning == true and charging == false{
	spd = clamp(lerp(spd, b_spd, deccel), b_spd, spd);
	x += lengthdir_x(hspd, mv_angle);
	y += lengthdir_y(vspd, mv_angle);
	scr_collision();
	if collision_circle(x,y,44,obj_barr, false, true){
		if (bounce){
			bnce(instance_nearest(x,y,obj_barr));
		} else {
			minibounce(instance_nearest(x,y,obj_barr));
		}
	}
	image_speed = clamp((.1 * spd), .25, 5);
	if (spd == b_spd){
		spinning = false;
	}
}

if (knocked == true){
	spd = lerp(spd, 0, .3);
	x += lengthdir_x(hspd, mv_angle);
	y += lengthdir_y(vspd, mv_angle);
	scr_collision();
	if collision_circle(x,y,44,obj_barr, false, true){
		if (bounce){
			bnce(instance_nearest(x,y,obj_barr));
		} else {
			minibounce(instance_nearest(x,y,obj_barr));
		}
	}
	if (floor(spd) <= 0){
		knocked = false;
	}
}


// Combat
if (global.can_abil == true){
	if (keyboard_check_pressed(ord("Q")) and cd == false){
		if (bon_spd > 0){
			if (bon_spd == 34) {
				spd = 111;
				bon_spd = 0;
				bounce = true;
			} else {
				spd = spd + bon_spd;
				bon_spd = 0;
			}
		tut_q = true;
		}
		var _att = instance_create_layer(x, y, "Instances", obj_shield);
		_att.toss(mv_angle, spd);
		_att.bounce = bounce;
		_att.deccel = clamp(deccel * .333, .05, deccel);
		atkout = true;
		spd = b_spd;
	}
	if (keyboard_check_pressed(ord("W")) and cd == false){
		if (atkout == true){
			if (object_exists(obj_shield)){
				obj_shield.expand();
			}
			cd = true;
		} else {
			var _att = instance_create_layer(x,y,"Instances",obj_shield);
			_att.mode = 1;
			atkout = true;
			cd = true;
		}
	tut_w = true;
	}

	if (keyboard_check_pressed(ord("E")) and cd == false){
		if (atkout == true){
			if (object_exists(obj_shield)){
				var _tposx = x;
				var _tposy = y;
			
				x = obj_shield.x;
				y = obj_shield.y;
			
				obj_shield.ang = mv_angle;
				obj_shield.x = _tposx;
				obj_shield.y = _tposy;
			
				obj_camera.x = x;
				obj_camera.y = y;
				tut_e = true;
			
			}
			cd = true;
		} 
	}
}
if (spinning == true and mouse_check_button(mb_left) and cd == false and atkout == false and global.can_attack == true){
	var _att = instance_create_layer(x, y, "Instances", obj_swipe);
	_att.image_angle = point_direction(x,y,mouse_x, mouse_y) - 90;
	cd = true
	
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
	if(spd >= 66){
		obj_cutscener.code = "full_charge";	
	}
	if(tut_q and tut_w and tut_e){
		obj_cutscener.code = "tut_abil";	
	}
	if(instance_place(x,y,obj_enemy)){
		obj_cutscener.code = "tut_charge";	
	}
}