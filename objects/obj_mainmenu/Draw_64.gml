switch(menu){
	case("Main"):
		draw_set_font(fnt_main);
		draw_text(64,64, "Sigil of Darkness");
		draw_text(64,128, "Start Game");
		draw_text(64,144, "Close Game");
		break;
}
draw_rectangle(32, 128 + (selection * 16), 48, 136 + (selection * 16), false);