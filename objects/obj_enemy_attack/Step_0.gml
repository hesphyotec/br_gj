if (instance_place(x,y,obj_swipe)){
	obj_player.bnce(obj_enemy);
	obj_player.inframes(30);
	if (obj_player.mega_charge == true){
		obj_enemy.minibounce(obj_player);
	} else {
		obj_enemy.bnce(obj_player);	
	}
	alarm[0] = 30;
}

event_inherited();

x = master.x;
y = master.y;

