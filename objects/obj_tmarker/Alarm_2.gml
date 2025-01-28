if (collision_circle(x,y, 256, obj_player, true, true)){
	obj_player.hp--;
}
instance_destroy(self);