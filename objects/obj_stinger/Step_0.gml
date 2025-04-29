if (instance_place(x,y ,obj_player)and (image_index == 3 or image_index == 4)){
	with(obj_player){
		if (immune == false) {
			alarm[2] = 30;
			alarm[1] = 60;
			hp--;
		} else {
			if (charge_shield == true){
				charge_shield = false;	
			}
		}
		
	}
	with(obj_damage){
		alarm[0] = 60;
	}
}

//(collision_line(x,y, x + lengthdir_x(512, image_angle-5), y + lengthdir_y(512, image_angle-5), obj_player, true, true) or collision_line(x,y, x + lengthdir_x(512, image_angle+5), y + lengthdir_y(512, image_angle+5), obj_player, true, true))