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
	with(obj_spinscythe){
		alarm[0] = 60;
	}
}

mult = (mult + .005);
var _mult = sin(pi * mult);
ang = (ang + 2 * spd) mod 360;
spd = lerp(spd, 2, .01);
rad = 512 * _mult;
x = obj_rivian.x + lengthdir_x(rad, ang);
y = obj_rivian.y + lengthdir_y(rad, ang);
