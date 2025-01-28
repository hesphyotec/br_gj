with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite_ext(other.sprite_index, other.image_index, other.x, other.y, 1, 1, other.image_angle, c_white, 1);
	surface_reset_target();
}
if (instance_place(x,y, obj_enemy) and damage_done == false){
	obj_surface_effect.effect_slash(c_fuchsia);
}