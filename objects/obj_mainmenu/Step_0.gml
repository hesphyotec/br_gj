/// @description Insert description here
// Handles options

if (enabled){
	switch(keyboard_key){
		case(vk_down):
			if (cd == false){
				selection = clamp((selection+1) mod maxop, 0, maxop);
				cd = true;
			}
			break;
		case(vk_up):
			if (cd == false){
				selection = clamp((selection-1) mod maxop, 0, maxop);
				cd = true;
			}
			break;
		case(vk_left):
			if (cd == false){
				if (menu == "Options"){
					switch(selection){
						case(0):
							master_slide = clamp(master_slide - .05, 0, 1);
							global.mastervol = master_slide;
							break;
						case(1):
							music_slide = clamp(music_slide - .05, 0, 1);
							global.musicvol = music_slide;
							break;
						case(2):
							effect_slide = clamp(effect_slide - .05, 0, 1);
							global.effectvol = effect_slide;
							break;
					}
					execute(selection, menu);
					cd = true;
				} else if (menu == "Level"){
					selection = clamp((selection-1) mod maxop, 0, maxop);
					cd = true;
				}

			}
			break;
		case(vk_right):
			if (cd == false){
				if (menu == "Options"){
					switch(selection){
						case(0):
							master_slide = clamp(master_slide + .05, 0, 1);
							global.mastervol = master_slide;
							global.user_data.update_value("mastervol", global.mastervol);
							break;
						case(1):
							music_slide = clamp(music_slide + .05, 0, 1);
							global.musicvol = music_slide;
							global.user_data.update_value("musicvol", global.musicvol);
							break;
						case(2):
							effect_slide = clamp(effect_slide + .05, 0, 1);
							global.effectvol = effect_slide;
							global.user_data.update_value("effectvol", global.effectvol);
							break;
					}
					execute(selection, menu);
					cd = true;
				}  else if (menu == "Level"){
					selection = clamp((selection+1) mod maxop, 0, maxop);
					cd = true;
				}
			}
			break;
		case(vk_enter):
			if (cd == false){
				execute(selection, menu);
				cd = true;
			}
			break;
		default:
			cd = false;
			break;
	}


	switch(menu){
		case("Main"):
			if(mouse_x > (room_width/2) - 256 and mouse_x < (room_width/2) + 256){
				if (mouse_y > room_height/2 + 128 and mouse_y < room_height/2 + 224){
					selection = 0;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				} else if (mouse_y > room_height/2 + 256 and mouse_y < room_height/2 + 352){
					selection = 1;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
						alarm[2] = 10;
					}
				} else if (mouse_y > room_height/2 + 384 and mouse_y < room_height/2 + 480){
					selection = 2;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				}
			}
			break;
		case("Options"):
			if(device_mouse_x_to_gui(0) > (display_get_gui_width()/2) - 256 and device_mouse_x_to_gui(0) < (display_get_gui_width()/2) + 640){
				if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 96){
					selection = 0;
					if (mouse_check_button(mb_left)){
						master_slide = clamp((device_mouse_x_to_gui(0) - (display_get_gui_width()/2) - 256) / (384), 0 ,1);
						execute(selection, menu);
					}
				} else if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 128 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 224){
					selection = 1;
					if (mouse_check_button(mb_left)){
						music_slide = clamp((device_mouse_x_to_gui(0) - (display_get_gui_width()/2) - 256) / (384), 0, 1);
						execute(selection, menu);
					}
				} else if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 256 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 352){
					selection = 2;
					if (mouse_check_button(mb_left) and alarm[2] <= 0){
						effect_slide = clamp((device_mouse_x_to_gui(0) - (display_get_gui_width()/2) - 256) / (384), 0, 1);
						execute(selection, menu);
					}
				} else if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 384 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 480){
					selection = 3;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				}
			}
			break;
		case("Pause"):
			if(device_mouse_x_to_gui(0) > (display_get_gui_width()/2) - 256 and device_mouse_x_to_gui(0) < (display_get_gui_width()/2) + 256){
				if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 128 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 224){
					selection = 0;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				} else if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 256 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 352){
					selection = 1;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				} else if (device_mouse_y_to_gui(0) > display_get_gui_height()/2 + 384 and device_mouse_y_to_gui(0) < display_get_gui_height()/2 + 480){
					selection = 2;
					if (mouse_check_button_pressed(mb_left)){
						execute(selection, menu);
					}
				}
			}
			break;
		case("Level"):
			if(device_mouse_x_to_gui(0) < (display_get_gui_width()/3)){
				selection = 0;
				if (mouse_check_button_pressed(mb_left)){
					execute(selection, menu);
				}
			} else if(device_mouse_x_to_gui(0) < (2 * display_get_gui_width()/3) and device_mouse_x_to_gui(0) > (display_get_gui_width()/3)){
				selection = 1;
				if (mouse_check_button_pressed(mb_left) and global.level_unl > 0){
					execute(selection, menu);
				}
			} else if(device_mouse_x_to_gui(0) < (3 *display_get_gui_width()/3) and device_mouse_x_to_gui(0) > ( 2* display_get_gui_width()/3)){
				selection = 2;
				if (mouse_check_button_pressed(mb_left) and global.level_unl > 1){
					execute(selection, menu);
				}
			}
	}
}



