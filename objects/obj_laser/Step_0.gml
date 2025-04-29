/// @description Insert description here
// You can write your code in this editor
event_inherited();
var _aurarad = 5 + irandom_range(-1, 1);
aura.x_rad = _aurarad;
aura.y_rad = _aurarad;
if instance_place(x,y,obj_player) and (alarm[1] <= 0){
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
image_angle = obj_starmage.att_angle;
