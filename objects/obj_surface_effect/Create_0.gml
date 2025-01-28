depth = -100;
gpu_set_depth(-100);
effect_surf = surface_create(room_width, room_height);
eff = "none";
ang = 0;
spread = 0;
effect_slash = function(_col){
	eff = "slash"
	spread = random_range(5,15);
	ang = point_direction(obj_player.x, obj_player.y, obj_enemy.x, obj_enemy.y);
	alarm[0] = 15;
}

effect_clash = function(_col){
	eff = "clash"
	spread = random_range(5,15);
	alarm[0] = 5;
}

//