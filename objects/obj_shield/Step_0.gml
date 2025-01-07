switch(mode){
	case(0):
		if instance_place(x,y, obj_enemy){
			obj_enemy.hp -= 1;	
		}
		spd = lerp(spd, 0, deccel)
		var _x = lengthdir_x(spd * xflip, ang);
		var _y = lengthdir_y(spd * yflip, ang);
		x += _x;
		y += _y;
		scr_collision()
		if collision_rectangle(x-64, y-64, x+64,y +64,obj_barr, false, true){
			if (bounce){
				bnce(instance_nearest(x,y, obj_barr));	
			} else regress();
		}
	
		if floor(spd) == 0{
			regress();
		}
		if returning == true{
			ang = point_direction(x,y, target.x, target.y);
			spd = lerp(0, 66, .5);
			if instance_place(x,y,obj_player){
				obj_player.cd = false;
				obj_player.atkout = false;
				instance_destroy(self)
			}
		}
		image_angle += 25;
		break;
	case(1):
		if instance_place(x,y, obj_enemy){
			obj_enemy.hp -= .1;	
			obj_enemy.bnce(self);
		}
		sprite_index = spr_bigshield;
		spd = lerp(spd, 0, .3)
		if (alarm[0] <= 0 and alarm[1] <= 0){
			if (expandcombo == true){
				alarm[0] = 33;
			} else {
				alarm[1] = 33;
			}
		}
}