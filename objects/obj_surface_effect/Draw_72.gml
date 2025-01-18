if(surface_exists(effect_surf)){
	surface_set_target(effect_surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	draw_surface_ext(effect_surf,0, 0 , 1, 1, 0 ,c_white, 1);
} else {
	effect_surf = surface_create(room_width, room_height);	
}



