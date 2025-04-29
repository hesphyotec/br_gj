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
aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_purple;
aura.color_thick = .7;
aura.whiteness = 1;
aura.x_rad = 3;
aura.y_rad = 3;