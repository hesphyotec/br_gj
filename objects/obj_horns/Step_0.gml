/// @description Insert description here
// You can write your code in this editor
event_inherited();
var _clinex1 = x + lengthdir_x(512, image_angle);
var _clinex2 = x - lengthdir_x(512, image_angle);
var _cliney1 = y + lengthdir_y(512, image_angle);
var _cliney2 = y - lengthdir_y(512, image_angle);
if collision_line(_clinex1, _cliney1, _clinex2, _cliney2, obj_player, true, true) and (alarm[1] <= 0){
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
image_angle = (image_angle + 1);
