mode = 0; // Mode, 0 = Throw
spd = 0;
ang = 0;
str = 0;
target = obj_player;
returning = false;
xflip = 1;
yflip = 1;
bounce = false;
deccel = .1;
expandcombo = false;
dmg = 5;
toss = function(_dir, _str){
	mode = 0;
	ang = _dir;
	spd = 2*_str;
	str = _str;
}
regress = function(){
	xflip = 1;
	yflip = 1;
	target = obj_player;
	returning = true;
}

bnce = function(_obj){
	if (place_meeting(x-64, y, _obj) or place_meeting(x+64, y, _obj)){
		xflip = -xflip;
	}
	if (place_meeting(x, y-64, _obj) or place_meeting(x, y+64, _obj)){
		yflip = -yflip;
	}
}

expand = function(){
	sprite_index = spr_bigshield;
	mode = 1;
	expandcombo = true;
}