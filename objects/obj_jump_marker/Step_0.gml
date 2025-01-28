if (chase){
	x = lerp(x, obj_player.x, .1);	
	y = lerp(y, obj_player.y, .1);
} else {
	if (alarm[2] <= 0){
		alarm[2] = 60;
	}
}