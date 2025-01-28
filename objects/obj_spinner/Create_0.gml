damage_done = false;
tar = 0;
spd = 0;
xflip = 1;
yflip = 1;
bounce = false;
master = obj_axemage;

wallbounce = function(_obj){
	if (place_meeting(x + lengthdir_x(spd * xflip, tar), y, _obj)){
		xflip = -xflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
	if (place_meeting(x, y  + lengthdir_y(spd * yflip, tar), _obj)){
		yflip = -yflip;
		obj_camera.shake_scr(10,20 * (spd/33));
	}
}