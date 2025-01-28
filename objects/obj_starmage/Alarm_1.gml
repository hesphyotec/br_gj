switch(mode){
	case(1):
		state = "none";	
		substate = "none";
		mode = -1;
		aggression = 0;
		dashes = 0;
		break;
	case(2):
		clone.destroy_self();
		state = "none";	
		substate = "none";
		mode = -1;
		aggression = 0;
		dashes = 0;
		break;
	case(10):
		instance_destroy(obj_laser);
		state = "none";	
		substate = "none";
		mode = -1;
		aggression = 0;
		break;
	default:
		state = "none";	
		substate = "none";
		mode = -1;
		aggression = 0;
		break;
}