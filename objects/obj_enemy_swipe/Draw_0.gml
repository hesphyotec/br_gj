if (image_index > 9){
	image_index = 7;
}


with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite(other.sprite_index, other.image_index, other.x, other.y);
	surface_reset_target();
}




