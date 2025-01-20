song = noone;

playsong = function(_song){
	audio_play_sound(_song, 1, true, global.musicvol);
	song = _song;
}

stopsong = function(){
	audio_stop_sound(song);	
}

fadesong = function(_fadespd){
	audio_sound_gain(song, 0, _fadespd);
}

if(room == rm_testmenu){
	playsong(snd_mainmenu);	
}