aura.x = x;
aura.y = y;
var _aurarad = 1 + .25* (spd/11);
aura.x_rad = _aurarad;
aura.y_rad = _aurarad;
if (state == "charging" and alarm[0] <= 0){ // sets charging alarm
	xflip = 1;
	yflip = 1;
	alarm[0] = 300;
}
if (alarm[0] > 0) { // plays spinning animation
	x += lengthdir_x(2, point_direction(x,y,obj_player.x, obj_player.y));
	y += lengthdir_y(2, point_direction(x,y,obj_player.x, obj_player.y));
	scr_circ_collision();
	circ_stop();
	spd++;
}
// Movement
if (state == "spin") {
	x += lengthdir_x(spd * xflip, att_angle);
	y += lengthdir_y(spd * yflip, att_angle);
	scr_circ_collision();
	circ_stop();
	if (floor(spd) == 0 and dashes < max_dash and alarm[0] <= 0){
		xflip = 1;
		yflip = 1;
		alarm[0] = 30;
	} else if (floor(spd) == 0){
		state = "none";	
		dashes = 0;
	}
}
if (state == "swirl") {
}

if instance_place(x,y,obj_barr){
	spd = 0;
}

if (state == "stun" and alarm[2] <= 0){
	x += lengthdir_x(spd * xflip, att_angle);
	y += lengthdir_y(spd * yflip, att_angle);
	scr_circ_collision();
	circ_stop();
	spd = lerp(spd, 0, .2);
	if (floor(spd) == 0){
		alarm[2] = 180;
	}
}