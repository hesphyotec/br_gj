x = 1110;
y = 1110;
depth = 100;
tilt = true;
gdir = 0;
gdis = 0;
tdir1 = 0;
tdir2 = 0;
tdistx = 0;
tdisty = 0;
z = 0;
global.circ_max_x = 512;
global.circ_max_y = 512;

rotmat = [	[cos(tdir1), -sin(tdir1)],
			[sin(tdir1), cos(tdir1)]
			];
rxmat =		[[1, 0, 0],
			 [0, cos(tdir1), -sin(tdir1)],
			 [0, sin(tdir1), cos(tdir1)]]
rymat =		[[cos(tdir2), 0, sin(tdir2)],
			 [0, 1, 0],
			 [-sin(tdir2),0, cos(tdir2)]]

xmat = [-512, 512, 512, -512];
ymat = [-512, -512, 512, 512];
zmat = [100, 100, 100, 100];
tmat = 0;
tmat2 = 0;

minx = x;
miny = y;
maxx = x;
maxy = y;