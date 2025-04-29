if (obj_cutscener.alarm[0] <= 0){
	if (mouse_check_button_pressed(mb_left)){
		if (image_index == 2){
			instance_destroy(self);	
		} else {
			image_index += 1;
		}
	}
}