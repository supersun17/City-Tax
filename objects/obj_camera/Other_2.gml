/// @description Insert description here
// You can write your code in this editor
cameraX = 1500;
cameraY = 1000;

cameraWidth = 600;
cameraHeight = 600;

displayScale = 1;

view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

// Window
windowWidth = cameraWidth * displayScale;
windowHeight = cameraHeight * displayScale;

window_set_size(windowWidth, windowHeight);
surface_resize(application_surface, windowWidth, windowHeight);

alarm[0] = 1;