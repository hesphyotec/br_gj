// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_circ_collision(){
	var distx = x - 1110;
	var disty = y - 1110;

	var max_distance = 512;
	var current_angle = point_direction(0,0,distx,disty);

	var max_distx = lengthdir_x(max_distance,current_angle);
	var max_disty = lengthdir_y(max_distance,current_angle);

	if abs(distx) > abs(max_distx) {x += max_distx - distx;}
	if abs(disty) > abs(max_disty) {y += max_disty - disty;}
}