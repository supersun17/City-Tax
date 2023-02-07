/// @description Insert description here
// You can write your code in this editor

// If plan is on top of this, stop
if position_meeting(mouse_x, mouse_y, obj_plan) {
	return;
}

if instance_exists(obj_panel) {
	instance_destroy(obj_panel);
	return;
}

updateGame();
updateColor();



