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