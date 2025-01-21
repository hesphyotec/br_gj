//charge alarm
switch(state){
	case("teleport"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_swipe);
		_att.image_angle = point_direction(x,y, obj_player.x, obj_player.y);
		_att.master = self;
		attcount++;
		alarm[3] = 60;
		break;
	case("telespin"):
		var _tpoint = [obj_player.x, obj_player.y];
		var _tang = random(360);
		x = _tpoint[0] + lengthdir_x(256, _tang);
		y = _tpoint[1] + lengthdir_y(256, _tang);
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = .1;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		substate = "spin";
		break;
	default:
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		lball = false;
		spd = 7;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		state = "spin";
		break;
}

