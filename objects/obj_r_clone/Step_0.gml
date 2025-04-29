aura.x = x;
aura.y = y;
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
	with(obj_r_clone){
		alarm[0] = 60;
	}
}
spd = lerp(spd, 33, .01);
x = x + lengthdir_x(spd, dir);
y = y + lengthdir_y(spd, dir);

