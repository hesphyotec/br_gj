image_index = clamp(image_index, 0,6);
with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite(other.sprite_index, other.image_index, other.x, other.y);
	surface_reset_target();
}
