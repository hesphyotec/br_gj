//charge alarm


var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
_att.master = self;
lball = false;
spd = 7;
att_angle = point_direction(x,y,target.x, target.y);
xflip = 1;
yflip = 1;
state = "spin";