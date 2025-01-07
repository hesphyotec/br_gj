if (follow != noone){
	xto = follow.x;
	yto = follow.y;
}

x += (xto-x)/15;
y += (yto - y)/15;
camera_set_view_pos(view_camera[0], x-camwidth*0.5, y-(camheight*0.5));