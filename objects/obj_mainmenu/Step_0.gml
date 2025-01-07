/// @description Insert description here
// Handles options
switch(keyboard_key){
	case(vk_down):
		if (cd == false){
			selection = clamp((selection+1) mod 2, 0, 1);
			cd = true;
		}
		break;
	case(vk_up):
		if (cd == false){
			selection = clamp((selection-1) mod 2, 0, 1);
			cd = true;
		}
		break;
	case(vk_enter):
		if (cd == false){
			execute(selection, menu);
			cd = true;
		}
		break;
	default:
		cd = false;
		break;
}





