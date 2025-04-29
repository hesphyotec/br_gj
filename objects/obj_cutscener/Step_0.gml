if (global.cs_active == true){
	if (d_finished == true and waiting == false){
		if (mouse_check_button_pressed(mb_left)){
			get_next_line();
		}
	}
	if (alarm[0] > 0){
		a_fade = lerp(a_fade, 1, .1);	
	}
	if (waiting == true){
		switch(waitcode){
			case("fullcharge"):
				if(fullcharge){
					get_next_line();
				}
				break;
			case("megaspin"):
				if(megaspin){
					get_next_line();
				}
				break;
			default:
				if (code == waitcode){
					get_next_line();	
				}
		}
	}
}