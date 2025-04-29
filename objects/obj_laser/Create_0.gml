image_angle = 270;
obj_camera.shake_scr(300,5);
aura = instance_create_layer(x, y, "Lights", obj_lightsource);
aura.color = c_purple;
aura.color_thick = 1;
aura.whiteness = .5;
aura.x_rad = 5;
aura.y_rad = 5;