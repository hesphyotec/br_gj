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
	if (place_meeting(x + lengthdir_x(spd, ang), y, _obj)){
		xflip = -xflip;
	}
	if (place_meeting(x, y  + lengthdir_y(spd, ang), _obj)){
		yflip = -yflip;
	}
	
}
circ_bounce = function(){
	var distx = x - 1110;
	var disty = y - 1110;

	var max_distance = 512;
	var current_angle = point_direction(0,0,distx,disty);

	var max_distx = lengthdir_x(max_distance,current_angle);
	var max_disty = lengthdir_y(max_distance,current_angle);

	if abs(distx) > abs(max_distx) {
		xflip = -xflip;

	}
	if abs(disty) > abs(max_disty) {
		yflip = -yflip;
	}
}

expand = function(){
	sprite_index = spr_bigshield;
	mode = 1;
	expandcombo = true;
}