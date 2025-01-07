// Initialization

spd = 33;
moving = true;
mv_angle = 0;
tarx = 0;
tary = 0;
image_speed = 0;

settarget = function(_x, _y, _spd){
	mv_angle = point_direction(x, y, _x, _y);
	tarx = _x;
	tary = _y;
	spd = _spd;
}