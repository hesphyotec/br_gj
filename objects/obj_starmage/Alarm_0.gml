//charge alarm
switch(state){
	case("charging"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = 20;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		state = "spin";
		dashes++;
		break;
	case("spin"):
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		spd = 20;
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		state = "spin";
		dashes++;
		break;
	case("signatk"):
		switch(mode){
			case(3):
				if(substate == "charging" or substate == "grab"){
					spd = 20;
					att_angle = point_direction(x,y,target.x, target.y);
					xflip = 1;
					yflip = 1;
					substate = "grab";
					dashes++;
				} else {
					var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
					_att.master = self;
					spd = 20;
					att_angle = point_direction(x,y,target.x, target.y);
					xflip = 1;
					yflip = 1;
					substate = "followup";
					dashes++;
				}
				break;
			case(4):
				spd = 15;
				ltarx = obj_player.x;
				ltary = obj_player.y;
				att_angle = point_direction(x,y,ltarx, ltary);
				xflip = 1;
				yflip = 1;
				substate = "leap";
				dashes++;
				break;
			default:
				var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
				_att.master = self;
				spd = 20;
				att_angle = point_direction(x,y,target.x, target.y);
				xflip = 1;
				yflip = 1;
				substate = "spin";
				dashes++;
				break;
		}
}
//var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
//_att.master = self;
//spd = 20;
//att_angle = point_direction(x,y,target.x, target.y);
//xflip = 1;
//yflip = 1;
//if (state == "signatk"){
//	substate = "spin";	
//} else {
//	state = "spin";	
//}
//dashes++;