if (instance_place(x, y, obj_player) and alarm[0] <= 0){
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
	with(obj_spinner){
		alarm[0] = 60;
	}
}
spd = lerp(spd, 33, .01);
x = x + lengthdir_x(spd * xflip, tar);
y = y + lengthdir_y(spd * yflip, tar);
if (bounce){
	wallbounce(obj_barr);	
}

