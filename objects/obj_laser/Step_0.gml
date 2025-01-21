/// @description Insert description here
// You can write your code in this editor
event_inherited();
if instance_place(x,y,obj_player) and (alarm[1] <= 0){
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
	alarm[1] = 60;
}
image_angle = obj_starmage.att_angle;
