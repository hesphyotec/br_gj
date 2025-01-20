/// @description Insert description here
// You can write your code in this editor
if (tilt){
	draw_sprite_pos(sprite_index, image_index,  x + xmat[0],  y + ymat[0], x + xmat[1], y + ymat[1], x + xmat[2], y + ymat[2], x + xmat[3], y + ymat[3], 1);
	draw_ellipse(minx +x,miny +y,(maxx/2) +x, (maxy/2) +y, true);
} else {
	draw_self();
}


