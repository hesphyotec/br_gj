// Initialization
spd = 33;
moving = true;
mv_angle = 0;
tarx = 0;
tary = 0;

settarget = function(_x, _y, _spd){
	mv_angle = point_direction(x, y, _x, _y);
	tarx = _x;
	tary = _y;
	spd = _spd;
}

aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_yellow;
aura.color_thick = 1;
aura.whiteness = .8;
aura.x_rad = 1;
aura.y_rad = 1;