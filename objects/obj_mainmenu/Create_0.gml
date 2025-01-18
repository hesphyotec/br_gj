/// Initialization
selection = 0;
maxop = 3;
menu = "Main";
cd = false;

master_slide = global.mastervol;
music_slide = global.musicvol;
effect_slide = global.effectvol;

execute = function(_sel, _men){
	switch(_men){
		case("Main"):
			switch(_sel){
				case(0):
					obj_musiccontrol.fadesong(100);
					alarm[1] = 30;
					break;
				case(1):
					maxop = 4;
					menu = "Options";
					break;
				case(2):
					game_end();
					break;
			}
			break;
		case("Options"):
			switch(_sel){
				case(0):
					global.mastervol = master_slide;
					audio_set_master_gain(0, global.mastervol);
					break;
				case(1):
					global.musicvol = music_slide;
					audio_sound_gain(obj_musiccontrol.song, global.musicvol, 0)
					break;
				case(2):
					global.effectvol = effect_slide;
					break;
				case(3):
					selection = 1;
					maxop = 3;
					menu = "Main";
			}
	}
}

// menu effects

circ_off = 128;
circ_ang_off = 0;
circ_len = 256;
circ_grow = true;
circ_dist = 10;
pulse_out = true;
pulse_mult = 1.1;
aper = 0;

