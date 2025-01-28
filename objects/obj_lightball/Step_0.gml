/// @description Insert description here
// You can write your code in this editor
aura.x = x;
aura.y = y;

if (moving == true){
	x += lengthdir_x(spd, mv_angle);
	y += lengthdir_y(spd, mv_angle);
	if (point_in_circle(tarx, tary, x,y,32)){
		moving = false;	
		aura.x_rad = 3;
		aura.y_rad = 3;
	}
} else {
	spd = lerp(spd, 0, .5);
	if (alarm[1] <= 0){
		alarm[1] = 30;
	}
	if (collision_circle(x,y,64,obj_player,true,true) and alarm[0] <= 0){
		with(obj_player){
			if (immune == false){
				alarm[2] = 20;
				hp--;
			}
		}
		alarm[0] = 15;
	}
}





