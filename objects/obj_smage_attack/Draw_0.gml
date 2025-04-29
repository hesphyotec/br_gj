/// @description Insert description here
// You can write your code in this editor
switch(obj_starmage.mode){
	case(0):
		sprite_index = spr_sm_s_aries;
		break;
	case(4):
		sprite_index = spr_sm_s_cancer;
		break;
	default:
		sprite_index = spr_sm_s_base;
}	
if (master == obj_starclone){
	sprite_index = spr_sm_s_clone;	
}
with(obj_surface_effect){
	surface_set_target(effect_surf);
	draw_sprite(other.sprite_index, other.image_index, other.x, other.y);
	surface_reset_target();
}





