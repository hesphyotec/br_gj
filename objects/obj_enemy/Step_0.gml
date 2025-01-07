if (instance_place(x,y, obj_swipe)){
	if (obj_swipe.damage_done == false){
		hp = hp-5;
		obj_swipe.damage_done = true;	
	}
}

// Death

if hp <= 0 {
	instance_destroy(self);
}

// Aggression
aggression += 1;

if(aggression > 5 and charging == false and spinning == false){
	charging = true;
}

if(aggression > 100 and lball == false and charging == true){
	for(var i = 0; i < random(6); i++){
		var _att = instance_create_layer(x,y, "Instances", obj_lightball);
		_att.settarget(random_range(1246, 2686) , random_range(896, 2208), irandom_range(11,33));
	}
	lball = true;
}
if charging == true {
	spd = clamp(spd+1, 0, 69);
	image_angle = image_angle + (1 * spd);
	if (spd == 69){
		att_angle = point_direction(x,y,target.x, target.y);
		xflip = 1;
		yflip = 1;
		spinning = true;
		charging = false;
	}
}
// Movement
if spinning == true {
	x += lengthdir_x(spd * xflip, att_angle);
	y += lengthdir_y(spd * yflip, att_angle);
	scr_collision()
	image_angle = image_angle + (1 * spd);
	spd = lerp(spd, 0, .1);
	if (floor(spd) == 0){
		charging = true;
		spinning = false;
	}
	if (aggression > 100) and (distance_to_object(obj_player) < 200) {
		var _att = instance_create_layer(x,y,"Instances",obj_enemy_attack);
		_att.master = self;
		aggression = 0;
		lball = false;
	}
}
if instance_place(x,y,obj_barr){
	spinning = false;
	charging = true;
}

