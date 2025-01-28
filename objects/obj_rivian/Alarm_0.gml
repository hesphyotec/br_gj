//charge alarm
switch(state){
	case("teleport"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_swipe);
		_att.image_angle = point_direction(x,y, obj_player.x, obj_player.y);
		_att.master = self;
		attcount++;
		alarm[3] = 60;
		break;
	case("crazy_teleport"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_swipe);
		_att.image_angle = point_direction(x,y, obj_player.x, obj_player.y);
		_att.master = self;
		attcount++;
		alarm[3] = 30;
		t_next = [obj_player.x, obj_player.y];
		instance_create_layer(t_next[0], t_next[1], "Instances", obj_tmarker);
		break;
	case("clone_teleport"):
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
	case("grab"):
		switch(substate){
			case("charging"):
				spd = 30;
				att_angle = point_direction(x,y,target.x, target.y);
				attcount++;
				xflip = 1;
				yflip = 1;
				substate = "g_dash";
				break;
			case("grab_follow"):
				var _att = instance_create_layer(x,y,"Instances",obj_enemy_swipe);
				_att.image_angle = point_direction(x,y, obj_player.x, obj_player.y);
				_att.master = self;
				attcount++;
				substate = "charging";
				break;
		}
		break;
	case("minigrind"):
		switch(substate){
			case("charging"):
				spd = 30;
				att_angle = point_direction(x,y,target.x, target.y);
				attcount++;
				xflip = 1;
				yflip = 1;
				substate = "g_dash";
				break;
		}
		break;
	case("superspin"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = 30;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		substate = "spin";
		break;
	case("supertilt"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = 30;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		substate = "spin";
		break;
	case("ultraspin"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		_att = instance_create_layer(x,y, "Instances", obj_spinner);
		_att.tar = random(360);
		_att.bounce = true;
		spd = 33;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		substate = "spin";
		break;
	default:
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = 7;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		substate = "spin";
		break;
}

