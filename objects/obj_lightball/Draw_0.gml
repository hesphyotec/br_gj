if (moving == true){
	image_index = image_index mod 4;	
} else {
	image_index = 4 + (image_index mod 4);
}
draw_self();
