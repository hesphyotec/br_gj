// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_rec_collision(){
	var _tx = x;
	var _ty = y;
	
	x = xprevious;
	y = yprevious;
	
	var _disx = abs(_tx-x);
	var _disy = abs(_ty-y);
	
	repeat(_disx){
		if (point_in_triangle(x + sign(_tx - x), y, obj_squarebg.x + obj_squarebg.xmat[3], obj_squarebg.y + obj_squarebg.ymat[3], obj_squarebg.x + obj_squarebg.xmat[0], obj_squarebg.y + obj_squarebg.ymat[0], obj_squarebg.x + obj_squarebg.xmat[1], obj_squarebg.y + obj_squarebg.ymat[1]) or point_in_triangle(x, y, obj_squarebg.x + obj_squarebg.xmat[1], obj_squarebg.y + obj_squarebg.ymat[1], obj_squarebg.x + obj_squarebg.xmat[2], obj_squarebg.y + obj_squarebg.ymat[2], obj_squarebg.x + obj_squarebg.xmat[3], obj_squarebg.y + obj_squarebg.ymat[3])){
			x += sign(_tx - x);
			show_debug_message("not colliding");
		}
	}
	
	repeat(_disy){
		if (point_in_triangle(x, y + sign(_ty - y), obj_squarebg.x + obj_squarebg.xmat[3], obj_squarebg.y + obj_squarebg.ymat[3], obj_squarebg.x + obj_squarebg.xmat[0], obj_squarebg.y + obj_squarebg.ymat[0], obj_squarebg.x + obj_squarebg.xmat[1], obj_squarebg.y + obj_squarebg.ymat[1]) or point_in_triangle(x, y, obj_squarebg.x + obj_squarebg.xmat[1], obj_squarebg.y + obj_squarebg.ymat[1], obj_squarebg.x + obj_squarebg.xmat[2], obj_squarebg.y + obj_squarebg.ymat[2], obj_squarebg.x + obj_squarebg.xmat[3], obj_squarebg.y + obj_squarebg.ymat[3])){
			y += sign(_ty - y);
			show_debug_message("not colliding");
		}
	}	
}