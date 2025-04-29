if(global.player_dead){
	instance_destroy(self);	
}
if instance_exists(obj_player){
	x = master.x;
	y = master.y;
	image_angle+= 66;
	if (alarm[0] <= 0 and damage_done) {
		alarm[0] = 30;
	}

	if ((collision_circle(x,y, 128 * sizex, obj_enemy, true, true) or point_in_circle(obj_enemy.x,obj_enemy.y, x, y, 128* sizex)) and damage_done == false and global.cs_active == false){
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
}
