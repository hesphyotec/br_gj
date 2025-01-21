x += lengthdir_x(30, tar);
y += lengthdir_y(30,tar);
image_angle = tar + 90;
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
	with(obj_arrow){
		alarm[0] = 60;
	}
}