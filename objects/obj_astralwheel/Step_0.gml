image_speed = lerp(image_speed, .1 , .25);

if (image_speed < .5 and alarm[0] <= 0 and image_index == sel){
	alarm[0] = 180;	
}