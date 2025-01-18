x = master.x;
y = master.y;

if (alarm[0] <= 0) {
	alarm[0] = 10;
}

if (instance_place(x,y, obj_enemy) and damage_done == false){
	master.inframes(10);
	master.bnce(obj_enemy);
	with(obj_enemy){
		alarm[4] = 30;
		hp -= other.dmg;
		if (state != "stun"){
			bnce(other.master);
		}
	}
	damage_done = true;
}

