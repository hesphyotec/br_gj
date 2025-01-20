/// @description Insert description here
// You can write your code in this editor
if (instance_place(x, y, obj_player) and alarm[1] <= 0){
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
	with(obj_firetrail){
		alarm[1] = 60;
	}
}
if (moving == true){
	x += lengthdir_x(4, dir);
	y += lengthdir_y(4, dir);
}