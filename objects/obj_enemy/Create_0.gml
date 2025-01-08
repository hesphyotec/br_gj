hp = 100;

aggression = 0;
spd = 0;
hspd = 0;
vspd = 0;
charging = false;
spinning = false;
target = obj_player;
att_angle = 0;
xflip = 1;
yflip = 1;
lball = false;

bnce = function(_obj){
	if (place_meeting(x-64, y, _obj) or place_meeting(x+64, y, _obj)){
		xflip = -xflip;
	}
	if (place_meeting(x, y-64, _obj) or place_meeting(x, y+64, _obj)){
		yflip = -yflip;
	}
}

anim_tarx = 0;
anim_tary = 0;
anim_moving = false;
anim_endval = -1;
anim_val = -2;
anim_active = false
play_anim = function(_anim){
	switch(_anim){
		case("walk"):
			anim_active = true;
			anim_moving = true;
			anim_tarx = x;
			anim_tary = y + 1000;
			anim_endval = 0;
			break;
		
	}
}
endanim = function(){
	obj_cutscener.get_next_line();
	anim_active = false;
}

