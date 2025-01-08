if (global.cs_active == true){
	if (d_finished == true and waiting == false){
		if (keyboard_check(vk_enter)){
			get_next_line();
		}
	}
	if (waiting == true){
		if (waitcode == code){
			get_next_line();	
		}
	}
}