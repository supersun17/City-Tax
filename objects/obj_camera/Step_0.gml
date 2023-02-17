/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("W")) {
	cameraY -= 5;
}
if keyboard_check(ord("A")) {
	cameraX -= 5;
}
if keyboard_check(ord("S")) {
	cameraY += 5;
}
if keyboard_check(ord("D")) {
	cameraX += 5;	
}

camera_set_view_pos(view_camera[0], cameraX, cameraY);