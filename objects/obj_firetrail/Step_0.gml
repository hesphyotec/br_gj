/// @description Insert description here
// You can write your code in this editor
if (instance_place(x, y, obj_player) and alarm[0] <= 0){
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
if (moving == true){
	x += lengthdir_x(4, dir);
	y += lengthdir_y(4, dir);
}