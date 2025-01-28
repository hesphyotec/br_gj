/// @description Insert description here
// You can write your code in this editor

if (tilt){
	draw_sprite_pos(sprite_index, image_index,  x + xmat[0],  y + ymat[0], x + xmat[1], y + ymat[1], x + xmat[2], y + ymat[2], x + xmat[3], y + ymat[3], 1);
	draw_set_color(c_red);
	var max_distance = 512;
	var current_angle = point_direction(x,y,mouse_x,mouse_y);
	var max_distx = lengthdir_x((xmat[0] + xmat[3])/2,current_angle);
	var max_disty = lengthdir_y((ymat[0] + ymat[1])/2,current_angle);

	//draw_line(x +xmat[0], y+ ymat[0], x+xmat[1], y+ymat[1]);
	//draw_line(x +xmat[1], y+ymat[1],x+ xmat[2], y+ymat[2]);
	//draw_line(x +xmat[2], y+ymat[2], x+xmat[3], y+ymat[3]);
	//draw_line(x+xmat[3], y+ymat[3], x+xmat[0], y+ymat[0]);
	//draw_ellipse(x + xmat[0],y +ymat[0],x + xmat[2],y + ymat[2], true);
	//draw_ellipse(x + xmat[1],y +ymat[1],x + xmat[3],y + ymat[3], true);
	draw_set_color(c_white);
} else {
	draw_self();
}


