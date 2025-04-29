active_cs = "";
cs_line = 0;
freeze = false;
scrip = noone;
diag = false;
line = "";
anim_obj = noone;
anim = false;
d_sprite = spr_;
d_tbox = spr_;
d_font = fnt_main;
d_finished = false;
c_line = 0;
talk_i = 0;
fullcharge = false;
megaspin = false;
introline = 0;
a_fade = 1;
waiting = false;
waitcode = "";
code = "BLEH";

start_cs = function(_cs){
	global.cs_active = true;
	switch(_cs){
		case("/INTRO"):
			global.can_release = false;
			break;
	}
	cs_line = 0;
	scrip = file_text_open_read("cs_scripts.txt");
	c_line = file_text_read_string(scrip);
	while(c_line != _cs){
		file_text_readln(scrip);
		c_line = file_text_read_string(scrip);
	}
	get_next_line();
}

play_dialogue = function(_cs, _line){
	diag = true;
	line = _line[4];
	d_sprite = asset_get_index(_line[1]);
	switch(_line[1]){
		case("spr_ada_diag"):
			obj_camera.follow = obj_axemage;
			break;
		case("spr_yve_diag"):
			obj_camera.follow = obj_player;
			break;
		case("spr_rag_diag"):
			obj_camera.follow = obj_starmage;
			break;
		case("spr_riv_diag"):
			obj_camera.follow = obj_rivian;
			break;
	}
	d_tbox = asset_get_index(_line[2]);
	d_font = asset_get_index(_line[3]);
	d_finished = false;
	alarm[0] = 15;
}

play_animation = function(_cs, _line){
	anim = true;
	anim_obj = asset_get_index(_line[1]);
	anim_obj.play_anim(_line[2]);
}

get_line = function(_cs){
	var _line = string_split(c_line,"|",true);
	switch(_line[0]){
		case("playdiag"):
			play_dialogue(_cs, _line);
			break;
		case("playanim"):
			play_animation(_cs, _line);
			break;
		case("end"):
			obj_camera.follow = obj_player;
			end_scene();
			break;
		case("camera_focus"):
			obj_camera.follow = asset_get_index(_line[1]);
			get_next_line();
			break;
		case("mainmenu"):
			room_goto(rm_testmenu);
			break;
		case("playscreendiag"):
			a_fade = 0;
			play_dialogue(_cs, _line);
			break;
		case("waitfor"):
			waiting = true;
			waitcode = _line[1];
			switch(_line[1]){
				case("fullcharge"):
					obj_player.mousetut = true;
					break;
				case("megaspin"):
					obj_player.spintut = true;
					break;
				case("tut_abil"):
					break;
				case("tut_charge"):
					break;
			}
			break;
		case("skipif"):
			switch(_line[1]){
				case("fullcharge"):
					if(fullcharge){
						diag = false;
						anim = false;
						waiting = false;
						file_text_readln(scrip);
						file_text_readln(scrip);
						c_line = file_text_read_string(scrip);
						get_line(c_line);
					} else {
						get_next_line();
					}
					break;
				case("megaspin"):
					if(megaspin){
						diag = false;
						anim = false;
						waiting = false;
						file_text_readln(scrip);
						file_text_readln(scrip);
						c_line = file_text_read_string(scrip);
						get_line(c_line);
					} else {
						get_next_line();
					}
					break;
			}
			break;
		case("playsong"):
			obj_musiccontrol.playsong(asset_get_index(_line[1]));
			get_next_line();
			break;
		case("stopsong"):
			obj_musiccontrol.stopsong();
			get_next_line();
			break;
		case("levelend"):
			room_goto_next();
			break;
		default:
			end_scene();
			show_debug_message("Error Parsing Script");
			break;
	}
}

get_next_line = function(){
	diag = false;
	anim = false;
	waiting = false;
	file_text_readln(scrip);
	c_line = file_text_read_string(scrip);
	get_line(c_line);
}

end_scene = function(){
	active_cs = 0;
	cs_line = 0;
	file_text_close(scrip);
	c_line = 0;
	diag = false;
	anim = false;
	global.cs_active = false;
}

if(room == rm_intro_cs){
	start_cs("/TITLEINTRO");	
} else if (room == rm_credits){
	start_cs("/CREDITS");
}