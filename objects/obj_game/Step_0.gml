///Temp startgame
if(keyboard_check_released(vk_f4)){
	window_set_fullscreen(!window_get_fullscreen());
}
if keyboard_check_pressed(vk_escape){
	if (room == rm_intro_cs){
		room_goto(rm_testmenu);
	} else if (room != rm_testmenu){
		if (global.player_dead){
			room_goto(rm_testmenu);
		}
		if global.pause == false{
			instance_deactivate_all(true);
			instance_activate_object(obj_mainmenu);
			instance_activate_object(obj_musiccontrol);
			obj_mainmenu.enabled = true;
			obj_mainmenu.menu = "Pause";
			global.pause = true;
		} else {
			instance_activate_all();
			obj_mainmenu.enabled = false;
			global.pause = false;
		}
	} else {
		with(obj_mainmenu){
			switch(menu){
				case("Main"):
					game_end();
					break;
				default:
					menu = "Main";
					break;
			}
		}
	}
}
if(global.player_dead == true and alarm[0] <= 0){
	if(mouse_check_button(mb_right) or mouse_check_button(mb_left)){
		respawn_charge++;
		if (respawn_charge >= 180){
			room_restart();	
		}
	} else {
		respawn_charge = lerp(respawn_charge, 0, .1);	
	}
}