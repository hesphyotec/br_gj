if(instance_exists(obj_player)){
	with(obj_surface_effect){
		surface_set_target(effect_surf);
		draw_sprite_ext(other.sprite_index, other.image_index, other.x, other.y,other.sizex,other.sizey, other.image_angle, c_white, 1);
		surface_reset_target();
	}
	if (collision_circle(x,y, 144 * sizex, obj_enemy, true, true) and damage_done == false and global.cs_active == false){
		obj_surface_effect.effect_slash(c_fuchsia);
	}
}