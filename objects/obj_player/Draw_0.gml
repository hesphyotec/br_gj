/// Draw Code
draw_self();
//Draws Launch Arrow
if charging{
	draw_set_color(make_color_rgb(255, 255-(255 * spd/66), 255-(255 *spd/66)));
	var arr_x = lengthdir_x(333, mv_angle)
	var arr_y = lengthdir_y(333, mv_angle)
	
	draw_arrow(x,y, lerp(x,x + arr_x, spd/66), lerp(y,y + arr_y, spd/66), 5);
} else {
	draw_set_color(c_white)
}
//Debug
//draw_text(x,y-10,spd);
//draw_text(x,y-20,bon_spd);
//draw_text(x,y-30,vspd);
//draw_text(x,y-40,hspd);
