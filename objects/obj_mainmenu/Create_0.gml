/// Initialization
selection = 0;
menu = "Main";
cd = false;
execute = function(_sel, _men){
	switch(_men){
		case("Main"):
			switch(_sel){
				case(0):
					room_goto(rm_testing);
					break;
				case(1):
					game_end();
					break;
			}
			break;
	}
}