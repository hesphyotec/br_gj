camwidth = 960;
camheight = 540;
show_debug_message(display_get_height() / camheight)
show_debug_message(display_get_width() / camwidth)

camwidth = (ceil((window_get_width() / camwidth))/(window_get_width() / camwidth) * camwidth) 
camheight = (ceil((window_get_height() / camheight))/(window_get_height() / camheight) * camheight)

show_debug_message(display_get_height())
show_debug_message(display_get_width())
show_debug_message(camheight)
show_debug_message(camwidth)
camera_set_view_size(view_camera[0], (camwidth), (camheight));
follow = noone
if object_exists(obj_player){
	follow = obj_player;
} else { follow = obj_game}
x = follow.x;
y = follow.y;

xto = x;
yto = y;

// Shake stuff
s_amnt = 0;
shake_scr = function(_dur, _amnt){
	alarm[0] = _dur;
	s_amnt = _amnt;
}