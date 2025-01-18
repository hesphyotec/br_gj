if(surface_exists(effect_surf)){
	surface_set_target(effect_surf);
	surface_reset_target();
	draw_surface_ext(effect_surf,0, 0 , 1, 1, 0 ,c_white, 1);
} else {
	effect_surf = surface_create(room_width, room_height);	
}