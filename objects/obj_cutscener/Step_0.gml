if (global.cs_active == true){
	if (d_finished == true and waiting == false){
		if (mouse_check_button_pressed(mb_left)){
			get_next_line();
		}
	}
	if (waiting == true){
		if (waitcode == code){
			get_next_line();	
		}
	}
}