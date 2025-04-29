switch(state){
	case("s_throw"):
		switch(substate){
			case("throw"):
				instance_destroy(att.aura);
				instance_destroy(att);
				state = "none";
				substate = "none";
				aggression = 0;
				break;
		}
		break;
	default:
		state = "none";
		substate = "none";
		aggression = 0;
		spd = 0;
		break;
}