if (state == "blast"){
	if (collision_circle(x,y, 32, obj_player, false, true) and alarm[1] <= 0){
		with(obj_player){
			if (immune == false) {
				alarm[2] = 20;
				hp--;
			} else {
				if (charge_shield == true){
					charge_shield = false;	
				}
			}
		}
		alarm[1] = 60;
	}
	
}
