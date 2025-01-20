/// @description Insert description here
// You can write your code in this editor
if (tilt == true){
	tdir1 = arctan2(y - obj_starmage.y, 640);
	tdir2 = arctan2(obj_starmage.x - x, 640);
	rxmat =		[[1, 0, 0],
			 [0, cos(tdir1), -sin(tdir1)],
			 [0, sin(tdir1), cos(tdir1)]]
			 
	rymat =		[[cos(tdir2), 0, sin(tdir2)],
			 [0, 1, 0],
			 [-sin(tdir2),0, cos(tdir2)]]
	gdir = point_direction(x,y, obj_starmage.x, obj_starmage.y);
	gdis = point_distance(x,y, obj_starmage.x, obj_starmage.y);
	
	xmat = [-512, 512, 512, -512];
	ymat = [-512, -512, 512, 512];
	zmat = [100, 100, 100, 100];

	for(var i = 0; i < array_length(xmat); i++){
		tmat = (xmat[i] * rxmat[0][0]) + (ymat[i] * rxmat[0][1]) + (zmat[i] * rxmat[0][2]);
		zmat[i] = (xmat[i] * rxmat[2][0]) + (ymat[i] * rxmat[2][1]) + (zmat[i] * rxmat[2][2]);
		ymat[i] = (xmat[i] * rxmat[1][0]) + (ymat[i] * rxmat[1][1]) + (zmat[i] * rxmat[1][2]);
		xmat[i] = tmat;
		
	}
	
	for(var i = 0; i < array_length(xmat); i++){
		tmat = (xmat[i] * rymat[0][0]) + (ymat[i] * rymat[0][1]) + (zmat[i] * rymat[0][2]);
		zmat[i] = (xmat[i] * rymat[2][0]) + (ymat[i] * rymat[2][1]) + (zmat[i] * rymat[2][2]);
		ymat[i] = (xmat[i] * rymat[1][0]) + (ymat[i] * rymat[1][1]) + (zmat[i] * rymat[1][2]);
		xmat[i] = tmat;
	}
	
	minx = x;
	miny = y;
	maxx = x;
	maxy = y;
	
	for(var i = 0; i < array_length(xmat); i++){
		minx = min(minx, xmat[i]);
		miny = min(miny, ymat[i]);
		maxx = max(maxx, xmat[i]);
		maxy = max(maxy, ymat[i]);
	}
	var rx = (maxx - minx) / 2;
	var ry = (maxy - miny) / 2;
	
	// Player's position
	var player_x = 400;
	var player_y = 250;

	// Check if the player is inside the ellipse
	var distance = ((obj_player.x - x) * (obj_player.x - x)) / (rx * rx) + ((obj_player.y - y) * (obj_player.y - y)) / (ry * ry);
	if (distance > 1) {
		// Collision detected
		show_message("Collision Detected!");
		
	}
	with (obj_player){
		x += lengthdir_x(other.gdis/256, other.gdir);
		y += lengthdir_y(other.gdis/256, other.gdir);
		scr_circ_collision();
	}
}

