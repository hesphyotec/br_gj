// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_circ_collision(){
	if (!obj_circlebg.tilt){
		var distx = x - 1110;
		var disty = y - 1110;

		var max_distance = 512;
		var current_angle = point_direction(0,0,distx,disty);

		var max_distx = lengthdir_x(max_distance,current_angle);
		var max_disty = lengthdir_y(max_distance,current_angle);

		if abs(distx) > abs(max_distx) {x += max_distx - distx;}
		if abs(disty) > abs(max_disty) {y += max_disty - disty;}
	} else {
		var distx = x - 1110;
		var disty = y - 1110;
		var max_distance = 512;
		var current_angle = point_direction(distx, disty, 0, 0);
		var max_distx = lengthdir_x((obj_circlebg.xmat[0] + obj_circlebg.xmat[3])/2,current_angle);
		var max_disty = lengthdir_y((obj_circlebg.ymat[0] + obj_circlebg.ymat[1])/2,current_angle);	
		if abs(distx) > abs(max_distx) {x += max_distx - distx;}
		if abs(disty) > abs(max_disty) {y += max_disty - disty;}
	}
	
	
}