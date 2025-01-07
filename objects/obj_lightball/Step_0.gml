/// @description Insert description here
// You can write your code in this editor
if (moving == true){
	x += lengthdir_x(spd, mv_angle);
	y += lengthdir_y(spd, mv_angle);
	if (point_in_circle(tarx, tary, x,y,32)){
		moving = false;	
	}
} else {
	image_index = 1;
	spd = lerp(spd, 0, .5);
	if (alarm[0] <= 0){
		alarm[0] = 30;
	}
	if (collision_circle(x,y,64,obj_player,true,true) and alarm[1] <= 0){
		with(obj_player){
			if (immune == false){
				hp--;
			}
		}
		alarm[1] = 15;
	}
}





