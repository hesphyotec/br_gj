if (instance_place(x,y,obj_swipe)){
	obj_player.bnce(obj_enemy);
	obj_player.inframes(30);
	obj_surface_effect.effect_clash(c_fuchsia);
	if (obj_player.mega_charge == true){
		obj_enemy.minibounce(obj_player);
	} else {
		obj_enemy.bnce(obj_player);	
	}
	alarm[0] = 30;
}
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

x = master.x;
y = master.y;

