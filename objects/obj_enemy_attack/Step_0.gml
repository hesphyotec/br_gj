if (instance_place(x,y, obj_swipe)){
	master.bnce(obj_player);
	damage_done = true;
}

if (instance_place(x, y, obj_player) and damage_done == false){
	with(obj_player){
		if (immune == false) {	
			hp--;	
		}
	}
	damage_done = true;
}

if(image_index >= 3){
	instance_destroy(self);
}
x = master.x;
y = master.y;

