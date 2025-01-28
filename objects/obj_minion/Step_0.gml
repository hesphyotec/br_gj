var _dir = point_direction(x,y, obj_player.x, obj_player.y);
x += lengthdir_x(spd, _dir);
y += lengthdir_y(spd, _dir);

if (hp <= 0){
	instance_destroy(self);	
}

if (instance_place(x, y, obj_player) and alarm[0] <= 0){
	with(obj_player){
		if (immune == false) {
			alarm[2] = 30;
			spd = spd *.2;
		} else {
			if (charge_shield == true){
				charge_shield = false;	
			}
		}
		
	}
	with(obj_minion){
		alarm[0] = 60;
	}
}

if (instance_place(x,y,obj_swipe)){
	hp -= obj_swipe.dmg;
}