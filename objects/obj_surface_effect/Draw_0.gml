if(surface_exists(effect_surf)){
	surface_set_target(effect_surf);
	if (alarm[0] >0 and instance_exists(obj_enemy)){
		switch(eff){
			case("slash"):
					draw_sprite_pos(spr_effect, 0, obj_enemy.x,obj_enemy.y+32, obj_enemy.x,obj_enemy.y+32, obj_enemy.x +lengthdir_x(room_width, ang + spread) , obj_enemy.y + lengthdir_y(room_width, ang + spread) , obj_enemy.x + lengthdir_x(room_width, ang - spread), obj_enemy.y +  lengthdir_y(room_width, ang - spread), 1);
					ang = ang - 30;
					spread += random_range(-.5, .5);
					draw_sprite_pos(spr_effect, 0, obj_enemy.x,obj_enemy.y+32, obj_enemy.x,obj_enemy.y+32, obj_enemy.x +lengthdir_x(room_width, ang + spread) , obj_enemy.y +  lengthdir_y(room_width, ang + spread) , obj_enemy.x + lengthdir_x(room_width, ang - spread), obj_enemy.y + lengthdir_y(room_width, ang - spread), 1);
					ang = ang + 60;
					spread += random_range(-.5, .5);
					draw_sprite_pos(spr_effect, 0, obj_enemy.x,obj_enemy.y+32, obj_enemy.x,obj_enemy.y+32, obj_enemy.x +lengthdir_x(room_width, ang + spread) , obj_enemy.y +  lengthdir_y(room_width, ang + spread) , obj_enemy.x + lengthdir_x(room_width, ang - spread), obj_enemy.y + lengthdir_y(room_width, ang - spread), 1);
					ang = ang - 30;
					spread += random_range(-.5, .5);
					break;
			case("clash"):
				for(var i = 0; i < 360; i+= 30){
					draw_sprite_pos(spr_effect, 0, obj_enemy.x,obj_enemy.y+32, obj_enemy.x,obj_enemy.y+32, obj_enemy.x +lengthdir_x(room_width, ang + spread) , obj_enemy.y + lengthdir_y(room_width, ang + spread) , obj_enemy.x + lengthdir_x(room_width, ang - spread), obj_enemy.y +  lengthdir_y(room_width, ang - spread), 1);
					ang = (ang + i + spread) mod 360;
					spread += random_range(-.5, .5);
				}
				break;
		}
	}
	surface_reset_target();
	draw_surface_ext(effect_surf,0, 0 , 1, 1, 0 ,c_white, 1);
} else {
	effect_surf = surface_create(room_width, room_height);	
}