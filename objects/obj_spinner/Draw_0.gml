image_angle+=66;
with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite_ext(other.sprite_index, other.image_index, other.x, other.y, 1, 1, other.image_angle,c_white,1);
	surface_reset_target();
}

