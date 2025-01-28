if (state == "blast"){
	if (collision_circle(x,y, 64, obj_player, false, true) and alarm[0] <= 0){
		with(obj_player){
			if (immune == false) {
				alarm[2] = 20;
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
	
}
