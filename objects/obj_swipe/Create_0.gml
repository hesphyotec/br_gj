damage_done = false;
master = obj_player;
off = 1.4* irandom(4);
dmg = 5;

if(instance_exists(obj_player)){
	sizex = clamp(obj_player.spd/33, .25, 1.25);
	sizey = clamp(obj_player.spd/33, .25, 1.25);
}

hitfx = function(){
	var _spread = random_range(5,15);
	var _ang = point_direction(x,y, obj_enemy.x, obj_enemy.y);
	draw_sprite_pos(spr_effect, 0, x,y, x,y, lengthdir_x(room_width, _ang + _spread) , lengthdir_y(room_height, _ang + _spread) , lengthdir_x(room_width, _ang - _spread), lengthdir_y(room_height, _ang - _spread), 1);	
}