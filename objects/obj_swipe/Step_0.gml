if(global.player_dead){
	instance_destroy(self);	
}
x = master.x;
y = master.y;
image_angle+= 66;
if (alarm[0] <= 0) {
	alarm[0] = 10;
}

if (instance_place(x,y, obj_enemy) and damage_done == false){
	master.inframes(10);
	master.bnce(obj_enemy);
	obj_camera.shake_scr(15, 10 * obj_player.spd / 33);
	with(obj_enemy){
		alarm[4] = 30;
		hp -= other.dmg;
		if (state == "spin"){
			other.master.bnce(self);
			bnce(other.master);
		}
	}
	damage_done = true;
}

