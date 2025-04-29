if (chase){
	x = clamp(lerp(x, obj_player.x, .1), 1152, 1920)
	y = clamp(lerp(y, obj_player.y, .1), 1152, 1920)
} else {
	if (alarm[2] <= 0){
		alarm[2] = 60;
	}
}