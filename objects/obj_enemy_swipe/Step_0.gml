if (instance_place(x, y, obj_player) and alarm[0] <= 0 and (image_index > 6)){
	with(obj_player){
		if (immune == false) {
			alarm[2] = 30;
			hp--;
		} else {
			if (charge_shield == true){
				charge_shield = false;	
			}
		}
		
	}
	with(obj_enemy_swipe){
		alarm[0] = 60;
	}
}

x = master.x;
y = master.y;

