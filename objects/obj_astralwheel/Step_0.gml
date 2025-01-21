if(alarm[0] <=0){
	image_speed = lerp(image_speed, .1 , .1);
}	else image_speed = 0;
if (image_speed < .2 and round(image_index)-1 == sel){
	if (alarm[0] <= 0){
		alarm[0] = 180;	
	}
}