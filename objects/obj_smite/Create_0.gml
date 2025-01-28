circ_off = 32;
circ_ang_off = 0;
hp_rot = 0;
state = "charging";
alarm[1] = 180;

aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_yellow;
aura.color_thick = .7;
aura.whiteness = 1;
aura.x_rad = 2;
aura.y_rad = 2;