if(surface_exists(light_surf)){
	surface_set_target(light_surf);
	draw_clear(make_color_rgb(0,0,0));
	with (obj_lightsource){
		repeat(brightness){
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(sprite_index, 0, x, y, x_rad, y_rad, 0 , c_black, whiteness);
			gpu_set_blendmode(bm_zero);
			draw_sprite_ext(sprite_index, 0, x, y, x_rad, y_rad, 0 , color, color_thick);
			gpu_set_blendmode(bm_normal);
		}
	}
	surface_reset_target();
	draw_surface_ext(light_surf,0, 0 , 1, 1, 0 ,c_white, 0.4);
} else {
	light_surf = surface_create(room_width, room_height);	
}