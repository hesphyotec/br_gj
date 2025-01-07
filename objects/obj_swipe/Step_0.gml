x = master.x;
y = master.y;

if image_index >= 3 {
	instance_destroy(self)
}

if (instance_place(x,y, obj_enemy_attack)){
	master.bnce(obj_enemy);
}